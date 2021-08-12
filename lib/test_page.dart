// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class TestPage extends StatefulWidget {
// //   @override
// //   _TestPageState createState() => _TestPageState();
// // }

// // class _TestPageState extends State<TestPage> {
// //   var apiUrl = 'https://airpmo.herokuapp.com/api/auth/login';

// //   var payload = {
// //     "email": "558854634",
// //     "password": "558854634"
// //     };

// //   fun(){
// //     payload = jsonEncode(payload);
// //   }
// //   // var payload = {"phone": "+919987777333"};

// //   var header = {"Accept": "application/json"};

// //   void fetchData() async {
// //     var response = await http.post(
// //       apiUrl, body: payload,
// //       // headers: header
// //     );
// //     print(response.body);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: RaisedButton(
// //           onPressed: fetchData,
// //           child: Text("make request"),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // var response = await http.get(apiUrl, headers: {
// //   "Accept": "application/json",
// //   "email": "558854634",
// //   "password": "558854634",
// // });
// // print(response.body);

// // String url = "https://airpmo.herokuapp.com/api/auth/login";

// // THE VALANJA VAZHI TO MAKE A REQUEST
// // void fetchData1() async {
// //   HttpClientRequest request = await client.postUrl(apiUrl);

// //   request.write(json.encode(payload));

// //   HttpClientResponse response = await request.close();

// //   Stream responseStream = response.transform(Utf8Decoder());
// //   await for (var data in responseStream) {
// //     print('Received data: $data');
// //   }
// // }

// // import 'dart:async';
// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class PostHeader {
// //   final String contentType;
// //   PostHeader({this.contentType});

// //   Map toMapHeader() {
// //     var map = new Map<String, String>();

// //     map["Content-type"] = contentType;
// //     return map;
// //   }
// // }

// // class Post {
// //   final String email;
// //   final String password;

// //   Post({this.email, this.password});

// //   factory Post.fromJson(Map<String, dynamic> json) {
// //     return Post(
// //       email: json['userId'],
// //       password: json['title'],
// //     );
// //   }

// //   Map toMapBody() {
// //     var map = new Map<String, String>();

// //     map["email"] = email;
// //     map["password"] = password;

// //     return map;
// //   }
// // }

// // Future<Post> createPost(String url, {Map<String, String> body, Map<String, String> headers}) async {
// //   return http
// //       .post(url, body: body)
// //       .then((http.Response response) {
// //     final int statusCode = response.statusCode;

// //     if (statusCode < 200 || statusCode > 400 || json == null) {
// //       print(statusCode);
// //       throw new Exception("Error while fetching data");
// //     }
// //     return Post.fromJson(json.decode(response.body));
// //   });
// // }

// // class TestPage extends StatelessWidget {
// //   final Future<Post> post;

// //   TestPage({Key key, this.post}) : super(key: key);
// //   static final CREATE_POST_URL = 'https://airpmo.herokuapp.com/api/auth/login';

// //   // TextEditingController titleControler = new TextEditingController();
// //   // TextEditingController bodyControler = new TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text('Create Post'),
// //         ),
// //         body: Container(
// //           margin: const EdgeInsets.only(left: 8.0, right: 8.0),
// //           child: RaisedButton(
// //             onPressed: () async {
// //               Post newPostBody = Post(
// //                 password: "558854634",
// //                 email: "558854634",
// //               );
// //               PostHeader  newPostHeader = PostHeader(
// //                 contentType: "application/json; charset=UTF-8"
// //               );
// //               Post p = await createPost(CREATE_POST_URL,
// //                   body: newPostBody.toMapBody(),
// //                   headers: newPostHeader.toMapHeader());
// //               print(p.password);
// //             },
// //             child: const Text("Create"),
// //           ),
// //         ));
// //   }
// // }

// import 'dart:convert';
// // import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// class TestPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Post'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () async {
//             // String token = await login();
//             // await saveToken(token);
//             // String savedToken = await getSavedToken();
//             // print(savedToken);
//             // getJobCard(savedToken);

//             // getJobCard(token);
//             // print("login button clicked...");
//             // String token = await login();
//             // print('loged in successfuly');
//             // // await saveToken(token);
//             // // print('the saved token is ...');
//             // // String savedToken = await getToken();
//             // // print(savedToken);
//             // getJobCard(token);
//           },
//         ),
//       ),
//     );
//   }

//   getJobCard(String token) async {
//     String url = 'https://airpmo.herokuapp.com/api/clients/index?search=';
//     Map<String, String> headers = {
//       "Content-type": "application/json",
//       'Accept': 'application/json',
//       "Authorization": "Bearer " + token,
//       // 'token': token,
//       // HttpHeaders.authorizationHeader: token
//     };
//     Response response = await get(url, headers: headers);
//     int statusCode = response.statusCode;
//     if (statusCode < 200 || statusCode > 400 || json == null) {
//       print(statusCode);
//       print(response.body);
//       throw Exception("Error while fetching data");
//     }

//     var jsonResponse = json.decode(response.body);
//     print(jsonResponse);
//     print('titles are:');
//     for (int i = 0; i < 4; i++) {
//       print(jsonResponse[i]['name']);
//     }
//   }
// }

// // final stringToBase64 = utf8.fuse(base64);

// // Map authentication() {
// //   final username = 'username';
// //   final password = 'password';

// //   final credentials = '$username:$password';

// //   final encodedCredentials = stringToBase64.encode(credentials);
// //   Map<String, String> headers = {
// //     HttpHeaders.contentTypeHeader: "application/json",
// //     HttpHeaders.authorizationHeader: "Basic $encodedCredentials",
// //   };
// //   return headers;
// // }

// //   String authenticationBody() {
// //     final username = '558854634';
// //     final password = '558854634';

// //     // final encodedPassword = stringToBase64.encode(password);
// //     // final encodedUsername = stringToBase64.encode(username);
// //     Map<String, String> body = {"email": username, "password": password};
// //     return json.encode(body);
// //   }

// //   _makePostRequest() async {
// //     // set up POST request arguments
// //     String url = 'https://airpmo.herokuapp.com/api/auth/login';

// //     Map<String, String> headers = {
// //       "Content-type": "application/json",
// //       'Accept': 'application/json',
// //     };

// //     // make POST request
// //     Response response =
// //         await post(url, headers: headers, body: authenticationBody());

// //     // check the status code for the result
// //     int statusCode = response.statusCode;
// //     print(statusCode);
// //     // this API passes back the id of the new item added to the body
// //     String body = response.body;
// //     print(json.decode(body));
// //     // {
// //     //   "title": "Hello",
// //     //   "body": "body text",
// //     //   "userId": 1,
// //     //   "id": 101
// //     // }
// //   }
// // }
