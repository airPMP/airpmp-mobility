import 'dart:convert';

import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Functions.dart';

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

    Response response =
        await post(url, headers: headers, body: credentialsJson);
    debugPrint("response is working");
    int statuscode = response.statusCode;
    print(statuscode);

    var jsonResponse = json.decode(response.body);
    print(jsonResponse);
    LoginDetails loginDetails = LoginDetails.fromJson(jsonResponse);
    return loginDetails;
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
    Response response = await get(url, headers: headers);
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
      Response response = await get(url, headers: headers);
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

// <Not Complete -- UNDER CONSTRUCTION>
  Future<Map<String, dynamic>?> addResources(String token) async {
    print('getting job card from internet..');
    var myJobCardsJson;
    var aJobCard;

    // -------------this will only get sama al jadaf's job cards -------------------
    print(userID);
    print(projectID);
    String url = 'https://airpmo.herokuapp.com/api/jobcard/$projectID';
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    Map body = {
      "_id": projectID,
      "actuals": [
        {
          "Id": "AT-EQ-EX-001",
          "designation": "Excavator",
          "name": "Komatsu PC400 Bi",
          "actualHours": "4",
          "remarks": "",
          "hourlySalary": 56.45161290322581,
          "plannedTotHrs": 0,
          "isEquipment": true,
          "date": "2021-08-22",
          "unPlanned": true
        },
      ],
      "achievedQTY": 3,
      "plannedVsAllowableVsActual": [
        {
          "designation": "LABOR",
          "unit": "No",
          "number": 3,
          "hours": 30,
          "actualTotCost": 0,
          "actualTotHours": 0,
          "spi": 0,
          "cpi": 0,
          "plannedTotCost": 0,
          "allowableTotCost": null
        },
      ]
    };
    try {
      Response response = await put(url, headers: headers, body: body);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // print('sucessfully obtained jobcards....');
        // myJobCardsJson = jsonDecode(response.body);
        // for (aJobCard in myJobCardsJson) {
        //   myJobCardsList.add(MyJobCard.fromJson(aJobCard));
        // }
      }
      // int len = myJobCardsList.length;
      // print("number of jc in obtained = $len");
      // // return myJobCardsList;
      // return {
      //   'myJobCardList': myJobCardsList,
      //   'numberOfJCs': myJobCardsList.length
      // };
    } catch (e) {
      print(e);
      return null;
    }
  }
}
