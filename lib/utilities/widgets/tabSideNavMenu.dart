import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:flutter/material.dart';

import 'components/stageCard.dart';

class SideNavMenu extends StatefulWidget {
  const SideNavMenu({Key? key}) : super(key: key);

  @override
  _SideNavMenuState createState() => _SideNavMenuState();
}

class _SideNavMenuState extends State<SideNavMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.backgroundColor,
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
              child: StageCard(
                  icon: Icon(Icons.task),
                  onPressed: () {},
                  text: Text("Not Started"))),
          Expanded(
              child: StageCard(
                  icon: Icon(Icons.task),
                  onPressed: () {},
                  text: Text("Not Started"))),
          Expanded(
              child: StageCard(
                  icon: Icon(Icons.task),
                  onPressed: () {},
                  text: Text("Not Started"))),
          Expanded(
              child: StageCard(
                  icon: Icon(Icons.task),
                  onPressed: () {},
                  text: Text("Not Started"))),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
