import 'package:flutter/material.dart';
import 'package:job_card/basic_frame.dart';
import 'package:job_card/screens/login_page.dart';
import 'package:job_card/utilities/functions.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var page;
  String token;
  @override
  void initState() {
    // setPage();
    super.initState();
  }

  Future<void> setPage() async {
    token = await getSavedToken();
    if (token == "token is null") {
      print('setting page to login_page');
      page = "login_page";
    } else {
      print('setting page to basic_frame');
      page = "basic_frame";
    }
    print("TOKEN IS $token");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: setPage(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (page == 'login_page')
          return LoginPage();
        else
          return BasicFrame();
      },
    );
  }
}
