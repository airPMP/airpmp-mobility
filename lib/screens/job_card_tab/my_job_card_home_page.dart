import 'package:flutter/material.dart';
import 'package:job_card/global_keys.dart';
import 'package:job_card/main.dart';
import 'package:job_card/utilities/functions.dart';
import 'package:job_card/utilities/widgets.dart';

class MyJobCardsHomePage extends StatefulWidget {
  MyJobCardsHomePage({Key key}) : super(key: key);

  @override
  _MyJobCardsHomePageState createState() => _MyJobCardsHomePageState();
}

class _MyJobCardsHomePageState extends State<MyJobCardsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: jobCardHomePageKey,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
                title: Text("Log out"),
                trailing: Icon(Icons.exit_to_app),
                onTap: () {
                  clearSharedPreferences();
                  runApp(MyApp());
                  basicFrameKey.currentState
                      .pushReplacementNamed("/login_page");
                  // myAppKey.currentState.pushNamed("/login_page");
                })
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.change_history), onPressed: null)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image.asset(
                "lib/assets/images/nlogos.png",
                height: 50,
                alignment: Alignment.centerLeft,
              ),
            ),
            SizedBox(height: 40),
            clickableCard(
                myJobCardRootPageKey, '/not_started_page', "Not Started"),
            clickableCard(
                myJobCardRootPageKey, '/in_progress_page', "In Progress"),
            clickableCard(myJobCardRootPageKey, '/waiting_for_approval_page',
                "Waiting for Approval"),
            clickableCard(
                myJobCardRootPageKey, '/approved_page', "Approved / Rejected"),
          ],
        ),
      ),
    );
  }
}
