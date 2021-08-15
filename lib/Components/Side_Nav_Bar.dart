import 'package:airpmp_mobility/Components/stageCard.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:flutter/material.dart';
class SideNavBar extends StatefulWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  _SideNavBarState createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.Backgroundcolor,
      child: Column(
        children: [
          Container(
              height: 100,
              child: Center(
                child: Text("Job Cards",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              )),
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: StageCard(
                icon: Icons.task, onPressed: () {}, text: "Not Started"),
          )),
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: StageCard(
                icon: Icons.task, onPressed: () {}, text: "In Progress"),
          )),
          Expanded(
              child: Align(
            alignment: Alignment.centerRight,
            child: StageCard(
                icon: Icons.task, onPressed: () {}, text: "Waiting For Approval"),
          )),
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: StageCard(
                icon: Icons.task, onPressed: () {}, text: "Approved"),
          )),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
