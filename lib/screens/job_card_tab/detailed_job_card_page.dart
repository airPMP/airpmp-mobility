import 'package:flutter/material.dart';
import 'package:job_card/utilities/constants.dart';
import 'package:job_card/utilities/widgets.dart';

class DetailedJobCardPage extends StatefulWidget {
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
        title: Text("asdlkfjsldkf"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          jobCardSingleDetail("Activity ID:", "4.02"),
          jobCardSingleDetail("Job Card Number:", "3452345lkfjsdfj324"),
          jobCardSingleDetail("Date", "2019-10-28"),
          jobCardSingleDetail("Quantity", "6"),
          jobCardSingleDetail("Zone", "T1 - F1R3"),
          jobCardSingleDetail("CPI", "1.061"),
          SizedBox(height: 30),
          button("Accept", null),
          button("Mark as complete", null),
        ],
      ),
    );
  }
}
