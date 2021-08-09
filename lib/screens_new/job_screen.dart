import 'package:airpmp_mobility/utilities/widgets/scrollableTable.dart';
import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/widgets/components/roundedButton.dart';
import 'package:flutter/material.dart';

class JobPage extends StatelessWidget {
  const JobPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, bc) {
      if (bc.maxWidth < 700) {
        return Scaffold(
            appBar: AppBar(
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
              leadingWidth: 0,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(24))),
              title: Text(
                "Job Card Details",
              ),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        // margin: EdgeInsets.all(20.0),
                        color: CustomColors.secondary,
                        child: Container(
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5.0),
                                    child: Text(
                                      "Seawater Fishhole Sidefilling 0-3 mtrSeawater Fishhole Sidefilling 0-3 mtr",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: TextButton(
                                    child: Text(
                                      "Details",
                                      style: TextStyle(
                                          color: CustomColors.secondary),
                                    ),
                                    onPressed: () {},
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
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
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomRoundedButton(
                              label: "Add Employee",
                              iconData: Icons.person_add,
                              onPressed: () {},
                            )),
                            Expanded(
                                child: CustomRoundedButton(
                              label: "Add Equipment",
                              iconData: Icons.add,
                              onPressed: () {},
                            ))
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Allowable vs Actual Resources",
                            style: TextStyle(
                                fontSize: 18, color: Color(0xdd7B9990))),
                      ),
                      Expanded(child: ScrollableTable())
                    ],
                  ),
                ),
                AnimatedCrossFade(
                    firstChild: Container(
                        margin: EdgeInsets.fromLTRB(17, 17, 17, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: CustomColors.secondary),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 50,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5.0),
                                        child: Text(
                                          "Seawater Fishhole Sidefilling 0-3 mtrSeawater Fishhole Sidefilling 0-3 mtr",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: TextButton(
                                        child: Text(
                                          "Details",
                                          style: TextStyle(
                                              color: CustomColors.secondary),
                                        ),
                                        onPressed: () {},
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text("Project"),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                          "Sama Al Jaddaf infrastructure works DS135/2"))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text("JC No"),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Text("9485729485752748FF"))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text("Zone"),
                                  ),
                                  Expanded(flex: 3, child: Text("N/A"))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text("Code"),
                                  ),
                                  Expanded(flex: 3, child: Text("4.10.1"))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15, 15, 15, 18),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text("Activity Name"),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                          "Seawater Fishhole Sidefilling 0-3 mtr"))
                                ],
                              ),
                            )
                          ],
                        )),
                    secondChild: Container(),
                    crossFadeState: CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 500)),
              ],
            ),
            floatingActionButton: AnimatedCrossFade(
              firstChild: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: CustomColors.secondary,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.save,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  )),
              secondChild: Container(
                // padding: EdgeInsets.all(8),
                margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                decoration: BoxDecoration(
                    color: CustomColors.secondary,
                    borderRadius: BorderRadius.circular(24)),
                child: // Row(mainAxisSize: MainAxisSize.min, children: [
                    // Icon(Icons.arrow_forward_ios),
                    Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                          ),
                          Text(" JC Executed "),
                          Container(width: 100, child: TextField())
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Qty to be achived"),
                        Container(width: 50, child: TextField()),
                        Text("Qty achived"),
                        Container(width: 50, child: TextField()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextButton(
                                child: Text(
                                  "Proceed",
                                  style: TextStyle(fontSize: 18),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.close,
                                  size: 30,
                                ))
                          ]),
                    )
                  ],
                ),
                // Container(
                //     decoration: BoxDecoration(
                //         shape: BoxShape.circle, color: Colors.white),
                //     padding: EdgeInsets.all(5),
                //     child: Icon(
                //       Icons.save,
                //       size: 30,
                //     ))
                // ]),
              ),
              crossFadeState: CrossFadeState.showSecond,
              duration: Duration(milliseconds: 500),
            ));
      } else {
        return Container();
      }
    });
  }
}
