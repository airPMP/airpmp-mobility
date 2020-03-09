import 'package:flutter/material.dart';
import 'package:job_card/global_keys.dart';
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              clickableCard(myJobCardRootPageKey, '/approved_page', "Approved / Rejected"),
            ],
          ),
        ),
      ),
    );
  }
}
