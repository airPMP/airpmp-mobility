import 'package:airpmp_mobility/Components/stageCard.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:flutter/material.dart';

class SideNavBar extends StatefulWidget {
  final Stage stage;
  final Function(Stage) onchanged;
  final bool isTab;
  const SideNavBar(
      {Key? key,
      required this.onchanged,
      required this.stage,
      required this.isTab})
      : super(key: key);

  @override
  _SideNavBarState createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.backgroundcolor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                height: widget.isTab ? 100 : 50,
                child: Center(
                  child: Text("Job Cards",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                )),
            Expanded(
                child: Align(
              alignment: widget.stage == Stage.Not_Started
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: StageCard(
                  stage: Stage.Not_Started,
                  icon: Icons.not_started,
                  onPressed: () {
                    widget.onchanged(Stage.Not_Started);
                  },
                  text: "Not Started"),
            )),
            Expanded(
                child: Align(
              alignment: widget.stage == Stage.In_Progress
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: StageCard(
                  stage: Stage.In_Progress,
                  icon: Icons.construction,
                  onPressed: () {
                    widget.onchanged(Stage.In_Progress);
                  },
                  text: "In Progress"),
            )),
            Expanded(
                child: Align(
              alignment: widget.stage == Stage.Waiting
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: StageCard(
                  stage: Stage.Waiting,
                  icon: Icons.access_time,
                  onPressed: () {
                    widget.onchanged(Stage.Waiting);
                  },
                  text: "Waiting For Approval"),
            )),
            Expanded(
                child: Align(
              alignment: widget.stage == Stage.Approved
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: StageCard(
                  stage: Stage.Approved,
                  icon: Icons.task,
                  onPressed: () {
                    widget.onchanged(Stage.Approved);
                  },
                  text: "Approved"),
            )),
            if (widget.isTab) SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
