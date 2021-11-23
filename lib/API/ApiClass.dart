import 'dart:convert';

import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Functions.dart';
import 'ResourceClasses.dart';

/// Call getIDs function to fetch IDs from local storage
class ApiClass {
  String projectID = '', userID = '';

  void getIDs() async {
    userID = await getUserId();
    projectID = await getProjectId();
  }

//<===========   Get Login Details     ==============>
  Future<LoginDetails> login(
      {required String username, required String password}) async {
    String url = 'https://airpmo.herokuapp.com/api/auth/login';

    Map<String, String> body = {
      "email": username,
      "password": password,
    };
    final credentialsJson = json.encode(body);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    Response response;
    try {
      response = await post(Uri.tryParse(url) ?? Uri(),
          headers: headers, body: credentialsJson);
    } catch (e) {
      return (LoginDetails(
          company: "", userid: "", token: "", statuscode: 500));
    }
    int statuscode = response.statusCode;
    print(statuscode.toString());
    if (statuscode == 200) {
      saveCredentials(username, password);
      var jsonResponse = json.decode(response.body);
      LoginDetails loginDetails = LoginDetails.fromJson(jsonResponse);
      return loginDetails;
    } else
      return (LoginDetails(
          company: "", userid: "", token: "", statuscode: statuscode));
  }

//<==============Get Project Details=================>

  Future<List<MyProject>?> getProjects(String token, String companyID) async {
    var projectsJson;
    var aProject;
    List<MyProject> listOfProjects = [];

    print('getting list of projects...');
    String url =
        "https://airpmo.herokuapp.com/api/projects/index?search=&company=" +
            companyID;
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    Response response;
    try {
      response = await get(Uri.tryParse(url) ?? Uri(), headers: headers);
    } catch (e) {
      return null;
    }
    if (response.statusCode == 200) {
      print('sucessfully obtained projects....');
      projectsJson = jsonDecode(response.body);
      for (aProject in projectsJson) {
        listOfProjects.add(MyProject.fromJson(aProject));
      }
      int len = listOfProjects.length;
      print("number of projects = $len");
      return listOfProjects;
    } else
      return null;
  }

  /// Get Details of the current project in which the user is working.
  /// Condition: The user should only work on a single project at a time.
  Future<ProjectDetails?> getMyProject(
      String token, String projectID, String companyID) async {
    var projectsJson;
    var aProject;

    String url =
        "https://airpmo.herokuapp.com/api/projects/index?search=&company=" +
            companyID;
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    Response response;
    try {
      response = await get(Uri.tryParse(url) ?? Uri(), headers: headers);
    } catch (e) {
      return null;
    }
    if (response.statusCode == 200) {
      print('sucessfully obtained projects....');
      projectsJson = jsonDecode(response.body);
      for (aProject in projectsJson) {
        if (aProject['_id'] == projectID)
          return ProjectDetails.fromJson(aProject);
      }
    } else
      return null;
  }

  Future<List<MyJobCard>?> getMyJobCard(String token, String userID) async {
    var myJobCardsJson;
    var aJobCard;
    List<MyJobCard> myJobCardsList = [];

    // -------------this will only get sama al jadaf 's job cards -------------------

    String url =
        'https://airpmo.herokuapp.com/api/jobcard/index?search=&userId=$userID';
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    try {
      Response response =
          await get(Uri.tryParse(url) ?? Uri(), headers: headers);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        print('sucessfully obtained jobcards....');
        myJobCardsJson = jsonDecode(response.body);
        for (aJobCard in myJobCardsJson) {
          myJobCardsList.add(MyJobCard.fromJson(aJobCard));
        }
      }
      int len = myJobCardsList.length;
      print("number of jc in obtained = $len");
      // return myJobCardsList;
      return myJobCardsList;
    } catch (e) {
      print(e);
      return null;
    }
  }

// < Complete -- UNDER TESTING >
  Future<int> addResources(
      MyJobCard job, String _token, SingleResource resource) async {
    String url =
        'https://airpmo.herokuapp.com/api/jobcard/${job.jobCardNumber}';
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + _token,
    };
    String body;
    bool unplanned = true, newresource = true;

    // Find whether a resource of the same designation has been already added to the plannedvsactuals.
    for (int i = 0; i < job.plannedvsactuals.length; i++) {
      if (job.plannedvsactuals[i].designation.toLowerCase() ==
          resource.desig.toLowerCase()) {
        job.plannedvsactuals[i].actualTotHours = ((double.tryParse(
                        job.plannedvsactuals[i].actualTotHours) ??
                    0) +
                (resource.acthours))
            .toString(); //add current hours to the total hours of the designation.
        unplanned = job.plannedvsactuals[i].planned;
        newresource = false;
        break;
      }
    }
    body = jsonEncode({
      "_id": job.jobCardNumber,
      "actuals": [
        for (ActualResource ar in job.actuals) ar.toJson(),
        ActualResource(
            resource.id,
            "${resource.acthours}",
            resource.desig,
            5.7, //TODO: Replace Hardcoded Value
            resource.isequipment,
            "${resource.fname} ${resource.lname}",
            6, //TODO: Replace Hardcoded Value
            resource.remarks,
            unplanned)
      ],
      "achievedQTY": job.achievedQTY,
      "plannedVsAllowableVsActual": [
        for (PlannedvsActualResource par in job.plannedvsactuals) par.toJson(),
        if (newresource) // New value should be added only if the same designation has not been added before.
          PlannedvsActualResource(
              4, //TODO: Replace Hardcoded Value
              resource.acthours.toString(),
              0,
              0,
              0,
              0, //TODO: Replace Hardcoded Value
              resource.desig,
              1,
              2,
              3,
              0,
              "" //TODO: Replace Hardcoded Value
              )
      ]
    });
    try {
      Response response =
          await put(Uri.tryParse(url) ?? Uri(), headers: headers, body: body);
      print(response.statusCode.toString() + " " + url + " " + body.toString());

      if (response.statusCode == 200) {
        print('sucessfully added resources....');
      }
      return response.statusCode;
    } catch (e) {
      print(e);
      return 300;
    }
  }

  Future<List<SingleResource>> fetchEquipments(String token, bool iseq) async {
    String url =
        "https://airpmo.herokuapp.com/api/hrms/getHRMSFromSpreadSheet?id=1LtpGuZdUivXEA4TqUvK9T3qRr1HER6TKzdSxTYPEAQ8&sheetId=AT+-+HRMS+format&apiKey=AIzaSyDoh4Gj_-xV033rPKneUFSpQSUpbqDqfDw";
    if (iseq)
      url =
          'https://airpmo.herokuapp.com/api/hrms/getHRMSFromSpreadSheet?id=1LtpGuZdUivXEA4TqUvK9T3qRr1HER6TKzdSxTYPEAQ8&sheetId=AT+-+Equipment+List+format&apiKey=AIzaSyDoh4Gj_-xV033rPKneUFSpQSUpbqDqfDw';
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    try {
      Response response =
          await get(Uri.tryParse(url) ?? Uri(), headers: headers);
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        if (iseq) {
          return jsonResponse
              .map((data) => SingleResource.equipmentFromJson(data))
              .toList();
        } else {
          return jsonResponse
              .map((data) => SingleResource.employeeFromJson(data))
              .toList();
        }
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      throw Exception('Unexpected error occured: ${e.toString()}!');
    }
  }

//<===========PUT RESOURCES===============>
// https://airpmo.herokuapp.com/api/jobcard/5d9db979c108b30004207c66

  Future<int> putResources(
      List<ActualResource> actuals, String token, String acheivedqty) async {
    String url =
        'https://airpmo.herokuapp.com/api/jobcard/5d9db979c108b30004207c66';
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    var body = jsonEncode({
      "_id": "5d9db979c108b30004207c66",
      "actuals": [
        for (ActualResource ar in actuals) ar.toJson(),
      ],
      "achievedQTY": acheivedqty,
      //plannedvsallocatedvsactual???
    });
    try {
      Response response =
          await put(Uri.tryParse(url) ?? Uri(), headers: headers, body: body);
    } catch (e) {
      print(e);
    }

    return 1;
  }
}
