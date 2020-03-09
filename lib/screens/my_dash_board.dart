import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyDashBoardPage extends StatefulWidget {
  @override
  _MyDashBoardPageState createState() => _MyDashBoardPageState();
}

class _MyDashBoardPageState extends State<MyDashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: Text(
            "DASHBOARD",
            style: TextStyle(
                fontSize: 20, letterSpacing: 10, color: Colors.black26),
          ),
        ),
      ),
      body: InAppWebView(
        initialOptions: InAppWebViewWidgetOptions(
            inAppWebViewOptions: InAppWebViewOptions(
          javaScriptEnabled: true,
        )),
        initialUrl: "https://airpmo.herokuapp.com/dashboard",
        // javascriptMode: JavascriptMode.unrestricted,
        initialHeaders: {
          'email': "12345678",
          'password': "12345678",
        },
      ),
    );
  }
}
