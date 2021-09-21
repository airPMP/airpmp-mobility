import 'package:airpmp_mobility/API/ResourceClasses.dart';
import 'package:airpmp_mobility/Components/simpleTable.dart';
import 'package:airpmp_mobility/Components/tableElement.dart';
import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:airpmp_mobility/Constants/Fonts_Styles.dart';
import 'package:flutter/material.dart';

class ActualResourcesPhone extends StatelessWidget {
  final Function onPush;
  final Resource resource;
  final MyJobCard jobCard;
  bool isSameResource(bool iseq) {
    if (iseq && resource == Resource.Equipment)
      return true;
    else if (!iseq && resource == Resource.Employee)
      return true;
    else
      return false;
  }

  const ActualResourcesPhone(
      {Key? key,
      required this.resource,
      required this.onPush,
      required this.jobCard})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(24)),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/appBarBG.png",
                ),
                fit: BoxFit.cover,
              )),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(24))),
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
                                hintStyle: CustomTextStyles.Hint_style,
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
                    style: TextStyle(fontSize: 20, color: Color(0xdd7B9990))),
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
                for (ActualResource resource in jobCard.actuals)
                  if (isSameResource(resource.isEquipment))
                    SimpleTableElement(
                      onTap: null,
                      datas: [
                        TableValueElement(resource.iD),
                        TableValueElement(resource.name, maxLines: 2),
                        TableValueElement(resource.designation, maxLines: 2),
                        TableValueElement(resource.actualHours),
                        TableValueElement(resource.remarks),
                      ],
                    ),
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
    );
  }
}
