import 'package:airpmp_mobility/Components/CustomRoundedButton.dart';
import 'package:airpmp_mobility/Components/simpleTable.dart';
import 'package:airpmp_mobility/Components/tableElement.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/functions.dart';
import 'package:flutter/material.dart';

class TabJobScreen extends StatelessWidget {
  // final Stage stage;
  final Function? onPush;
  const TabJobScreen({Key? key, this.onPush}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Job Screen",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )),
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Icon(Icons.arrow_back),
              //       Spacer(),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 18.0),
              //         child: Icon(
              //           Icons.notifications,
              //           size: 30,
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(right: 40.0),
              //         child: CircleAvatar(),
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  child: Card(
                    color: Color(0xffEDF1F6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  color: CustomColors.secondary,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10))),
                              child: Center(
                                  child: Text(
                                "4.10.1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 2,
                              ))),
                        ),
                        SizedBox(width: 1),
                        Expanded(
                          flex: 3,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: CustomColors.secondary,
                              ),
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
                        SizedBox(width: 1),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: CustomColors.secondary,
                              ),
                              child: Center(
                                  child: Text(
                                "[NA]",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 2,
                              ))),
                        ),
                        Expanded(
                            flex: 5,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Search..",
                                        prefixIcon: Icon(Icons.search)),
                                  )),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.all(5),
                          width: 200,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                hintText: "JC Executed",
                                prefixIcon: Icon(Icons.calendar_today)),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: CustomRoundedButton(
                            label: "Add Employee",
                            iconData: Icons.person_add,
                            onPressed: () {
                              onPush!(context, "actual_Equipments");
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomRoundedButton(
                            label: "Add Equipents",
                            iconData: Icons.person_add,
                            onPressed: () {
                              onPush!(context, "actual_Equipments");
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                flex: 48,
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
                    onTap: () {},
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
                    onTap: () {},
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
          Card(
              color: CustomColors.secondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Qty to be achieved",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    Container(
                        width: 100,
                        child: Padding(
                            padding: EdgeInsets.all(8), child: TextField())),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Qty to be achieved",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    Container(
                        width: 100,
                        child: Padding(
                            padding: EdgeInsets.all(8), child: TextField())),
                    CircleButton(
                        icon: Icon(
                      Icons.save,
                      size: 30,
                      color: CustomColors.secondary,
                    )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
