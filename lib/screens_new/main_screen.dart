import 'package:airpmp_mobility/models/tableElement.dart';
import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/constants/enums.dart';
import 'package:airpmp_mobility/utilities/constants/fonts.dart';
import 'package:airpmp_mobility/utilities/widgets/components/JobListTile.dart';
import 'package:airpmp_mobility/utilities/widgets/components/simpleTableElement.dart';
import 'package:airpmp_mobility/utilities/widgets/components/stageCard.dart';
import 'package:airpmp_mobility/utilities/widgets/drawer.dart';
import 'package:airpmp_mobility/utilities/widgets/simpleTable.dart';
import 'package:flutter/material.dart';

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

              Expanded(
                flex: 10,
                child: Container(
                  color: CustomColors.backgroundColor,
                  child: Column(
                    children: [
                      Container(
                          height: 100,
                          child: Center(
                            child: Text("Job Cards",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
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
                ),
              ),
              Expanded(
                  flex: 38,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Icon(
                                  Icons.notifications,
                                  size: 30,
                                ),
                              ),
                              CircleAvatar()
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "lib/assets/images/appBarBG.png"),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 20),
                            child: Text("Arab Tech",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 50,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18),
                                        decoration: BoxDecoration(
                                            color: CustomColors.secondary,
                                            borderRadius:
                                                BorderRadius.horizontal(
                                                    left: Radius.circular(10))),
                                        child: Center(
                                            child: Text(
                                          "Sama Al Jaddaf infrastructure works DS135/2",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          maxLines: 2,
                                        ))),
                                  ),
                                  Expanded(
                                      child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        width: 200,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: "Search..",
                                              suffixIcon: Icon(Icons.search)),
                                        )),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SimpleTable(headings: [
                            TableElement("Activity ID", flex: 100),
                            TableElement("Date", flex: 92),
                            TableElement("Description", flex: 248),
                            TableElement("Qty", flex: 40),
                            TableElement("Zone", flex: 54),
                            TableElement("Assigned", flex: 91),
                            TableElement("SPI", flex: 40),
                            TableElement("CPI", flex: 40),
                          ], elements: [
                            SimpleTableElement(
                              datas: [
                                TableValueElement("3.1.2"),
                                TableValueElement("2019-10-09"),
                                TableValueElement(
                                    "Irrigation Excavation (Open areas) 0 -3 mtr"),
                                TableValueElement("3"),
                                TableValueElement("-"),
                                TableValueElement("NO"),
                                TableValueElement("-"),
                                TableValueElement("-"),
                              ],
                            ),
                            SimpleTableElement(
                              datas: [
                                TableValueElement("3.1.2"),
                                TableValueElement("2019-10-09"),
                                TableValueElement(
                                    "Irrigation Excavation (Open areas) 0 -3 mtr"),
                                TableValueElement("3"),
                                TableValueElement("-"),
                                TableValueElement("NO"),
                                TableValueElement("-"),
                                TableValueElement("-"),
                              ],
                            )
                          ]),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        );
      }
    });
  }
}
