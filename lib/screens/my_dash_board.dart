import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyDashBoardPage extends StatefulWidget {
  @override
  _MyDashBoardPageState createState() => _MyDashBoardPageState();
}

class _MyDashBoardPageState extends State<MyDashBoardPage> {
  @override
  Widget build(BuildContext context) {
    
    return WebviewScaffold(
      url: "https://airpmo.herokuapp.com/login",
      headers: {
        "email": "12345678",
        "password": "12345678",
      },
    );
  }
}
