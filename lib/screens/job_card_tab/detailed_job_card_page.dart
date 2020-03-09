import 'package:flutter/material.dart';

class DetailedJobCardPage extends StatefulWidget {
  @override
  _DetailedJobCardPageState createState() => _DetailedJobCardPageState();
}

class _DetailedJobCardPageState extends State<DetailedJobCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Activity ID :"),
              Text("4.20"),
            ],
          )
        ],
      ),
    );
  }
}
