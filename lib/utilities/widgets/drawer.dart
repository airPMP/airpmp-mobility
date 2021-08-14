import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/widgets/tabSideNavMenu.dart';
import 'package:flutter/material.dart';

import 'components/stageCard.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(child: SideNavMenu()
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(15.0),
              //       child: Text("Project: Tabloviskey Halmikuttan Pi Asro",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               fontSize: 20, color: CustomColors.textColor)),
              //     ),
              //     Expanded(
              //         child: StageCard(
              //             icon: Icons.task,
              //             onPressed: () {
              //               onPush(context, "not_Started_Screen");
              //             },
              //             text: "Not Started")),
              //     Expanded(
              //         child: StageCard(
              //             icon: Icons.workspaces_outline,
              //             onPressed: () {
              //               onPush(context, "in_Progress_Screen");
              //             },
              //             text: "In Progress")),
              //     Expanded(
              //         child: StageCard(
              //             icon: Icons.access_time,
              //             onPressed: () {
              //               onPush(
              //                   context, "waiting_For_Approval_Screen");
              //             },
              //             text: "Waiting for Approval")),
              //     Expanded(
              //         child: StageCard(
              //             icon: Icons.approval,
              //             onPressed: () {
              //               Navigator.pushNamed(context, "approved_Screen");
              //             },
              //             text: "Approved")),
              //   ],
              // ),
              ),
        ],
      ),
    );
  }
}
