import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:job_card/models/job_card_models.dart';
import 'package:job_card/models/project_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// login function returns the String token
Future<Map<String, dynamic>> login(String email, String password) async {
  //"558854634"
  print("login is working..");

  String url = 'https://airpmo.herokuapp.com/api/auth/login';
  Map<String, String> body = {
    "email": email,
    "password": password,
  };

  final credentialsJson = json.encode(body);
  Map<String, String> headers = {
    "Content-type": "application/json",
    'Accept': 'application/json',
  };
  Response response = await post(url, headers: headers, body: credentialsJson);

  print('got the response');
  int statusCode = response.statusCode;
  if (statusCode < 200 || statusCode > 400 || json == null) {
    print(response.body);
    print(statusCode);
    return null;
    // throw Exception("Error while fetching data");
  }

  var jsonResponse = json.decode(response.body);
  String companyID = jsonResponse['user']['company'];
  String token = jsonResponse['token'];
  print("sucessfuly loged in!");

  return {
    'token': token,
    'statusCode': statusCode,
    'companyID': companyID,
  };
}

FutureOr<void> saveToken(String token) async {
  SharedPreferences storageSpace = await SharedPreferences.getInstance();
  storageSpace.setString("token", token);
  print('token saved!');
}

FutureOr<String> getSavedToken() async {
  SharedPreferences storageSpace = await SharedPreferences.getInstance();
  String token = storageSpace.getString("token");
  return token;
}

FutureOr<void> saveCompanyID(String companyID) async {
  SharedPreferences storageSpace = await SharedPreferences.getInstance();
  storageSpace.setString("companyID", companyID);
  print('companyID saved!');
}

FutureOr<String> getSavedCompanyID() async {
  SharedPreferences storageSpace = await SharedPreferences.getInstance();
  String companyID = storageSpace.getString("companyID");
  return companyID;
}

FutureOr<void> saveProjectID(String projectID) async {
  SharedPreferences storageSpace = await SharedPreferences.getInstance();
  storageSpace.setString("projectID", projectID);
  print('projectID saved!');
}

FutureOr<String> getSavedProjectID() async {
  SharedPreferences storageSpace = await SharedPreferences.getInstance();
  String projectID = storageSpace.getString("projectID");
  return projectID;
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

Future<List<MyProject>> getProjects(String token, String companyID) async {
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

Future<List<MyJobCard>> getJobCardByDate() {}

Future<Map<String, dynamic>> getMyJobCard(String token) async {
  print('getting job card from internet..');
  var myJobCardsJson;
  var aJobCard;
  List<MyJobCard> myJobCardsList = [];

  // -------------this will only get sama al jadaf 's job cards -------------------
  String url =
      'https://airpmo.herokuapp.com/api/jobcard/index?search=&userId=5c5ed93be43537215c6f5538&projectId=5d9d3faa2a36470004b05129';
  Map<String, String> headers = {
    "Content-type": "application/json",
    'Accept': 'application/json',
    "Authorization": "Bearer " + token,
  };
  Response response = await get(url, headers: headers);
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
}
