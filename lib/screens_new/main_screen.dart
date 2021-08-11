import 'package:airpmp_mobility/models/tableElement.dart';
import 'package:airpmp_mobility/screens_new/tab%20screens/tabMainScreen.dart';
import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/constants/enums.dart';
import 'package:airpmp_mobility/utilities/constants/fonts.dart';
import 'package:airpmp_mobility/utilities/widgets/components/JobListTile.dart';
import 'package:airpmp_mobility/utilities/widgets/components/stageCard.dart';
import 'package:airpmp_mobility/utilities/widgets/drawer.dart';
import 'package:airpmp_mobility/utilities/widgets/simpleTable.dart';
import 'package:airpmp_mobility/utilities/widgets/tabSideNavMenu.dart';
import 'package:flutter/material.dart';

import 'tab screens/tabActualEmployees.dart';
import 'tab screens/tabJobScreen.dart';

class MainPage extends StatelessWidget {
  final Stage stage;
  const MainPage({Key? key, required this.stage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, bc) {
      if (bc.maxWidth < 600) {
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
                                    image: AssetImage(
                                        "lib/assets/images/appBarBG.png"),
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
                                        style: CustomTextStyles.whiteTitle,
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
                  expandedHeight: bc.maxHeight / 3.3,

                  // Not Started App Bar
                  bottom: AppBar(
                    elevation: 0,
                    backgroundColor: CustomColors.primary,
                    leadingWidth: 0,
                    leading: Container(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(24))),
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
                          "Not Started",
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
                              color: CustomColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Expanded(
                        child: Text(
                          "Sama Al Jaddaf infrastructure works DS135/2",
                          style: TextStyle(
                              color: CustomColors.textColor,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: JobListTile());
                }, childCount: 30))
              ],
            ),
            drawer: CustomDrawer());
      } else {
        // Tablet View
        return Scaffold(
          body: Row(
            children: [
              // Side Navigation Rail
              // Navigation rail Widget not used due to the lack of proper trailing property
              Container(
                color: CustomColors.primary,
                child: Column(
                  children: [
                    Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(vertical: 25),
                        child: Image.asset("lib/assets/images/airpmo.png")),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Icon(Icons.dashboard,
                          color: CustomColors.icon_not_selected),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Icon(Icons.card_giftcard_outlined,
                          color: CustomColors.secondary),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Icon(Icons.edit,
                          color: CustomColors.icon_not_selected),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Icon(Icons.settings_outlined,
                          color: CustomColors.icon_not_selected),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Icon(Icons.logout,
                          color: CustomColors.icon_not_selected),
                    )
                  ],
                ),
              ),

              Expanded(flex: 10, child: SideNavMenu()),
              Expanded(
                  flex: 38,
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TabActualEmployees()))
            ],
          ),
        );
      }
    });
  }
}
