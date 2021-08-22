import 'dart:async';
import 'dart:convert';
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

FutureOr<void> saveToken(String token) async {

  
}
