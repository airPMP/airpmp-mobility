import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  Response response = await post(url, headers: headers, body: credentialsJson);
  print("response is working");
  int statuscode = response.statusCode;
  print(statuscode);

  var jsonResponse = json.decode(response.body);
  print(jsonResponse);
  LoginDetails loginDetails = LoginDetails.fromJson(jsonResponse);
  return loginDetails;
}

//<==============Secure Storage=================>

final SecureStorage secureStorage = SecureStorage();

FutureOr<void> saveToken(String token) async {
  secureStorage.writeSecureData("token", token);
  print("Token has been saved");
}

FutureOr<String> getToken() async {
  String token =
      await secureStorage.readSecureData("token") ?? "Token is invalid";
  return token;
}

FutureOr<void> saveCompanyId(String companyId) async {
  secureStorage.writeSecureData("companyId", companyId);
  print("Company Id has been saved");
}

FutureOr<String> getCompanyId() async {
  String companyId = await secureStorage.readSecureData("companyId") ??
      "Company Id is invalid";
  return companyId;
}

FutureOr<void> saveProjectId(String userId) async {
  secureStorage.writeSecureData("projectId", userId);
  print("Project Id has been saved");
}

FutureOr<String> getProjectId() async {
  String projectId = await secureStorage.readSecureData("projectId") ??
      "Project Id is invalid";
  return projectId;
}

FutureOr<void> saveUserId(String userId) async {
  secureStorage.writeSecureData("userId", userId);
  print("User Id has been saved");
}

FutureOr<String> getUserId() async {
  String userId =
      await secureStorage.readSecureData("userId") ?? "User Id is invalid";
  return userId;
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
Future<List<MyJobCard>> getInProgressJobCard(String token) async {
  print('geting in progress jsc');
  List<MyJobCard> inProgressList = [];
  dynamic allJC = await getMyJobCard(token);
  // print(allJC.length);
  allJC = allJC['myJobCardList'];

  for (MyJobCard aJC in allJC) {
    if (aJC.jcStatus == "In-Progress") {
      inProgressList.add(aJC);
    }
  }
  return inProgressList;
}

Future<List<MyJobCard>> getExecutedJobCard(String token) async {
  print('geting in progress jsc');
  List<MyJobCard> inProgressList = [];
  dynamic allJC = await getMyJobCard(token);
  allJC = allJC['myJobCardList'];
  // print(allJC.length);
  for (MyJobCard aJC in allJC) {
    if (aJC.jcStatus == "Executed") {
      inProgressList.add(aJC);
    }
  }
  return inProgressList;
}

Future<Map<String, dynamic>?> getMyJobCard(String token) async {
  print('getting job card from internet..');
  var myJobCardsJson;
  var aJobCard;
  final String userID = await getUserId();
  final String projectID = await getProjectId();
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
    return {
      'myJobCardList': myJobCardsList,
      'numberOfJCs': myJobCardsList.length
    };
  } catch (e) {
    print(e);
    return null;
  }
}

