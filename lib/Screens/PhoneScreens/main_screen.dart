import 'package:airpmp_mobility/Components/Drawer.dart';
import 'package:airpmp_mobility/Components/JobListTile.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:airpmp_mobility/Constants/Fonts_Styles.dart';
import 'package:flutter/material.dart';

class MainPagePhone extends StatefulWidget {
  final Stage stage;
  final Function? onPush;
  const MainPagePhone({Key? key, required this.stage, this.onPush})
      : super(key: key);

  @override
  _MainPagePhoneState createState() => _MainPagePhoneState();
}

class _MainPagePhoneState extends State<MainPagePhone> {
  Stage stage = Stage.Not_Started;
  String? _stageToString() {
    switch (stage) {
      case Stage.Not_Started:
        return "Not Started";
      case Stage.In_Progress:
        return "In Progress";
      case Stage.Waiting:
        return "Waiting For Approval";
      case Stage.Approved:
        return "Approved";
    }
  }

  @override
  void initState() {
    super.initState();
    stage = widget.stage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            // Includes the "Arabtech" part with background image and "Not Started" part

            SliverAppBar(
              backgroundColor: CustomColors.primary,
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 0,
              pinned: true,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(30))),
              flexibleSpace: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/appBarBG.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30))),
                        child: Row(
                          children: [
                            // Width between the left end of screen and ArabTech Text
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Arab Tech",
                                    style: CustomTextStyles.White_title,
                                  ),
                                ),
                                //Bottom Padding of ArabTech text
                                SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Space for the second appbar, with the not started text.
                    //Padding given so that the bottom left border radius will be seen
                    SizedBox(height: 56)
                  ],
                ),
              ),
              expandedHeight: MediaQuery.of(context).size.height / 3.3,

              // Not Started App Bar
              bottom: AppBar(
                elevation: 0,
                backgroundColor: CustomColors.primary,
                leadingWidth: 0,
                leading: Container(),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(24))),
                title: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.task,
                      color: CustomColors.icon_not_selected,
                      size: 30,
                    ),
                    Text(
                      _stageToString() ?? "Not Started",
                      style: TextStyle(
                          color: Color(0xff39597E),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // Project name above the list
            SliverAppBar(
              toolbarHeight: 80,
              leadingWidth: 0,
              leading: Container(),
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  SizedBox(width: 10),
                  Text("Project:  ",
                      style: TextStyle(
                          color: CustomColors.textcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  Expanded(
                    child: Text(
                      "Sama Al Jaddaf infrastructure works DS135/2",
                      style: TextStyle(
                          color: CustomColors.textcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, i) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: JobListTile(
                    text:
                        "Seawater Fishhole Sidefilling 0-3 mtr Seawater Fishhole Sidefilling 0-3 mtr",
                    iD: "0.14.0",
                    onPressed: () {
                      widget.onPush!(context, "job_Card_Screen");
                    },
                  ));
            }, childCount: 30))
          ],
        ),
        drawer: CustomDrawer(
          stage: stage,
          onChanged: (Stage st) {
            setState(() {
              stage = st;
            });
          },
        ));
  }
}

// class MainScreenTab extends StatelessWidget {
//   const MainScreenTab({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TabBaseStructure(child: TabMainScreen());
//   }
// }
