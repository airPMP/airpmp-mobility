import 'package:airpmp_mobility/utilities/components/scrollableTable.dart';
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
              leadingWidth: 0,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(24))),
              title: Text("Job Card Details"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    // margin: EdgeInsets.all(20.0),
                    color: CustomColors.secondary,
                    child: Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Seawater Fishhole Sidefilling 0-3 mtrSeawater Fishhole Sidefilling 0-3 mtr",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: TextButton(
                                child: Text("Details"),
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
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  // child:
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(child: CustomRoundedButton()),
                        Expanded(child: CustomRoundedButton())
                      ],
                    ),
                  ),
                  // ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Allowable vs Actual Resources",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xdd7B9990))),
                  ),
                  Expanded(child: ScrollableTable())
                ],
              ),
            ));
      } else {
        return Container();
      }
    });
  }
}
