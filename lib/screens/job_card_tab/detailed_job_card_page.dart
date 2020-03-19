import 'package:flutter/material.dart';
import 'package:job_card/models/job_card_models.dart';
import 'package:job_card/utilities/constants.dart';
import 'package:job_card/utilities/widgets.dart';

class DetailedJobCardPage extends StatefulWidget {
  DetailedJobCardPage({this.myJobCard});
  final MyJobCard myJobCard;
  @override
  _DetailedJobCardPageState createState() => _DetailedJobCardPageState();
}

class _DetailedJobCardPageState extends State<DetailedJobCardPage> {
  Widget jobCardSingleDetail(String leading, String traling) {
    return ListTile(
      leading: Text(leading, style: TextStyle(fontSize: 17)),
      trailing: Text(traling, style: TextStyle(fontSize: 17)),
      contentPadding: EdgeInsets.symmetric(horizontal: 35),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 60,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Status:",
                    style: heading3,
                  ),
                  Text(
                    "In Progress",
                    style: heading3,
                  )
                ],
              ),
            ),
          )),
      appBar: AppBar(
        title: Text(widget.myJobCard.activiyName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          jobCardSingleDetail("Activity ID:", widget.myJobCard.activityCode),
          jobCardSingleDetail(
              "Job Card Number:", widget.myJobCard.jobCardNumber),
          jobCardSingleDetail("Date", widget.myJobCard.assignedDate),
          // this is the quantity to be achived
          jobCardSingleDetail("Quantity", widget.myJobCard.tobeAchievedQTY),
          jobCardSingleDetail("Zone", widget.myJobCard.zone),
          jobCardSingleDetail("CPI", "fhytg"),
          SizedBox(height: 30),
          button("Place Holder", null),
          button("Mark as complete", null),
        ],
      ),
    );
  }
}
