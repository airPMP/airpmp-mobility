import 'package:airpmp_mobility/models/tableElement.dart';
import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/constants/fonts.dart';
import 'package:airpmp_mobility/utilities/widgets/components/simpleTableElement.dart';
import 'package:airpmp_mobility/utilities/widgets/simpleTable.dart';
import 'package:flutter/material.dart';

class ActualEmployees extends StatelessWidget {
  const ActualEmployees({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, bc) {
      if (bc.maxWidth < 700) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(24)),
                  image: DecorationImage(
                    image: AssetImage(
                      "lib/assets/images/appBarBG.png",
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(24))),
            title: Text("Job Card Details"),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  // margin: EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: Container(
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Search to add an Employee",
                                    hintStyle: CustomTextStyles.hintTextStyle,
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: TextButton(
                              child: Icon(Icons.search, color: Colors.white),
                              onPressed: () {},
                            ),
                            decoration: BoxDecoration(
                                color: CustomColors.secondary,
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(20))),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Actual Employees",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xdd7B9990))),
                  ),
                ),
                Expanded(
                    child: SimpleTable(
                  headings: [
                    TableElement("ID", flex: 2),
                    TableElement("Name", flex: 3),
                    TableElement("Designation", flex: 3),
                    TableElement("Total Hrs", flex: 2, maxLines: 2),
                    TableElement("Remarks", flex: 2),
                  ],
                  elements: [
                    SimpleTableElement(
                      datas: [
                        TableValueElement("DA1079"),
                        TableValueElement("PETER HAINE", maxLines: 2),
                        TableValueElement("Technical Reporter", maxLines: 2),
                        TableValueElement("5"),
                        TableValueElement("-"),
                      ],
                    ),
                    SimpleTableElement(
                      datas: [
                        TableValueElement("DA1079"),
                        TableValueElement("PETER HAINE", maxLines: 2),
                        TableValueElement("Architect", maxLines: 2),
                        TableValueElement("5"),
                        TableValueElement("-"),
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
          floatingActionButton: Container(
              // width: 100,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                  color: CustomColors.secondary,
                  borderRadius: BorderRadius.circular(40)),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Proceed",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ],
                ),
              )),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: "Dashboard"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel_sharp), label: "Job Cards")
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
