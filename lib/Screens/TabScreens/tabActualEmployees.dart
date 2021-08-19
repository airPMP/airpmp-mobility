import 'package:airpmp_mobility/Components/simpleTable.dart';
import 'package:airpmp_mobility/Components/tableElement.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:flutter/material.dart';

class TabActualResources extends StatelessWidget {
  final Function onPush;
  final Resource resource;
  const TabActualResources(
      {Key? key, required this.resource, required this.onPush})
      : super(key: key);

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
      body: Column(
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
                            "Actual Employees",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                          ))),
                    ),
                    Expanded(
                        flex: 3,
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
    );
  }
}
