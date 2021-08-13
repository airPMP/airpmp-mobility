import 'package:airpmp_mobility/screens_new/tab%20screens/tabBaseStructure.dart';
import 'package:airpmp_mobility/screens_new/tab%20screens/tabJobScreen.dart';
import 'package:airpmp_mobility/utilities/widgets/jobDetailsSheet.dart';
import 'package:airpmp_mobility/utilities/widgets/jobProceedSheet.dart';
import 'package:airpmp_mobility/utilities/widgets/scrollableTable.dart';
import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/widgets/components/roundedButton.dart';
import 'package:flutter/material.dart';

class JobPage extends StatelessWidget {
  const JobPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext pageContext) {
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
              iconTheme: IconThemeData(color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(24))),
              title: Text(
                "Job Card Details",
              ),
            ),
            body: JobPageBody(), // implemented below this widget.
            floatingActionButton:
                JobFloatingPanel()); // implemented below this widget.
      } else {
        return TabBaseStructure(child: TabJobScreen());
      }
    });
  }
}

class JobFloatingPanel extends StatefulWidget {
  const JobFloatingPanel({
    Key? key,
  }) : super(key: key);

  @override
  _JobFloatingPanelState createState() => _JobFloatingPanelState();
}

class _JobFloatingPanelState extends State<JobFloatingPanel> {
  bool panelIsOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InkWell(
        onTap: () {
          setState(() {
            panelIsOpen = true;
          });
        },
        child: Container(
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
      ),
      secondChild: JobProceedSheet(
        onClosed: () {
          setState(() {
            panelIsOpen = false;
          });
        },
      ),
      crossFadeState:
          panelIsOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 500),
    );
  }
}

class JobPageBody extends StatefulWidget {
  const JobPageBody({
    Key? key,
  }) : super(key: key);

  @override
  _JobPageBodyState createState() => _JobPageBodyState();
}

class _JobPageBodyState extends State<JobPageBody> {
  bool detailsSheetOpen = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
                              style: TextStyle(color: CustomColors.secondary),
                            ),
                            onPressed: () {
                              setState(() {
                                detailsSheetOpen = !detailsSheetOpen;
                              });
                            },
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
                      onPressed: () {
                        Navigator.pushNamed(context, "actual_Employees");
                      },
                    )),
                    Expanded(
                        child: CustomRoundedButton(
                      label: "Add Equipment",
                      iconData: Icons.add,
                      onPressed: () {
                        Navigator.pushNamed(context, "actual_Equipments");
                      },
                    ))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Allowable vs Actual Resources",
                    style: TextStyle(fontSize: 18, color: Color(0xdd7B9990))),
              ),
              Expanded(child: ScrollableTable())
            ],
          ),
        ),
        AnimatedCrossFade(
            firstChild: JobDetailsSheet(
              onPressed: () {
                setState(() {
                  detailsSheetOpen = !detailsSheetOpen;
                });
              },
            ),
            secondChild: Container(),
            crossFadeState: detailsSheetOpen
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 500)),
      ],
    );
  }
}
