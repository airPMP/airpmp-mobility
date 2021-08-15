import 'package:airpmp_mobility/Components/stageCard.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:flutter/material.dart';

class SideNavBar extends StatefulWidget {
  final Function(Stage) onchanged;
  const SideNavBar({Key? key, required this.onchanged}) : super(key: key);

  @override
  _SideNavBarState createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  Stage stage = Stage.Not_Started;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.backgroundcolor,
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
            alignment: stage == Stage.Not_Started
                ? Alignment.center
                : Alignment.centerLeft,
            child: StageCard(
                stage: Stage.Not_Started,
                icon: Icons.task,
                onPressed: () {
                  setState(() {
                    stage = Stage.Not_Started;
                  });
                  widget.onchanged(Stage.Not_Started);
                },
                text: "Not Started"),
          )),
          Expanded(
              child: Align(
            alignment: stage == Stage.In_Progress
                ? Alignment.center
                : Alignment.centerLeft,
            child: StageCard(
                stage: Stage.In_Progress,
                icon: Icons.task,
                onPressed: () {
                  setState(() {
                    stage = Stage.In_Progress;
                  });
                  widget.onchanged(Stage.In_Progress);
                },
                text: "In Progress"),
          )),
          Expanded(
              child: Align(
            alignment: stage == Stage.Waiting
                ? Alignment.center
                : Alignment.centerLeft,
            child: StageCard(
                stage: Stage.Waiting,
                icon: Icons.task,
                onPressed: () {
                  setState(() {
                    stage = Stage.Waiting;
                  });
                  widget.onchanged(Stage.Waiting);
                },
                text: "Waiting For Approval"),
          )),
          Expanded(
              child: Align(
            alignment: stage == Stage.Approved
                ? Alignment.center
                : Alignment.centerLeft,
            child: StageCard(
                stage: Stage.Approved,
                icon: Icons.task,
                onPressed: () {
                  setState(() {
                    stage = Stage.Approved;
                  });
                  widget.onchanged(Stage.Approved);
                },
                text: "Approved"),
          )),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
