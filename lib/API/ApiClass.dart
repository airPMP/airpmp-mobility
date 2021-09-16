import 'dart:convert';

import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Functions.dart';
import 'ResourceClasses.dart';

/// Call getIDs function to fetch IDs from local storage
class ApiClass {
  String projectID = '', userID = '';
  String _token = '';

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

    Response response = await post(Uri.tryParse(url) ?? Uri(),
        headers: headers, body: credentialsJson);
    debugPrint("response is working");
    int statuscode = response.statusCode;
    print(statuscode.toString());
    if (statuscode == 200) {
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
    Response response = await get(Uri.tryParse(url) ?? Uri(), headers: headers);
    print(response.body);

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

  Future<List<MyJobCard>?> getMyJobCard(String token) async {
    print('getting job card from internet..');
    var myJobCardsJson;
    var aJobCard;
    List<MyJobCard> myJobCardsList = [];

    // -------------this will only get sama al jadaf 's job cards -------------------
    print(userID);
    print(projectID);
    String url =
        'https://airpmo.herokuapp.com/api/jobcard/index?search=&userId=$userID&projectId=$projectID';
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    try {
      Response response =
          await get(Uri.tryParse(url) ?? Uri(), headers: headers);
      print(response.statusCode);
      // print(response.body);

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
  Future<int> addResources(MyJobCard job) async {
    String url = 'https://airpmo.herokuapp.com/api/jobcard/$projectID';
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + _token,
    };
    Map body = {
      "_id": job.jobCardNumber,
      "actuals": [
        for (ActualResource ar in job.actuals) ar.toJson(),
      ],
      "achievedQTY": job.achievedQTY,
      "plannedVsAllowableVsActual": [
        for (PlannedvsActualResource par in job.plannedvsactuals) par.toJson(),
      ]
    };
    try {
      Response response =
          await put(Uri.tryParse(url) ?? Uri(), headers: headers, body: body);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        print('sucessfully added resources....');
        // myJobCardsJson = jsonDecode(response.body);
        // for (aJobCard in myJobCardsJson) {
        //   myJobCardsList.add(MyJobCard.fromJson(aJobCard));
        // }
      }
      return response.statusCode;
      // int len = myJobCardsList.length;
      // print("number of jc in obtained = $len");
      // // return myJobCardsList;
      // return {
      //   'myJobCardList': myJobCardsList,
      //   'numberOfJCs': myJobCardsList.length
      // };
    } catch (e) {
      print(e);
      return 300;
    }
  }
}