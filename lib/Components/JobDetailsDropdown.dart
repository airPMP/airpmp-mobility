import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:flutter/material.dart';

class JobDetailsDropDown extends StatelessWidget {
  final VoidCallback onPressed;
  const JobDetailsDropDown({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                          style: TextStyle(color: CustomColors.secondary),
                        ),
                        onPressed: onPressed,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(20))),
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
                      child:
                          Text("Sama Al Jaddaf infrastructure works DS135/2"))
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
                  Expanded(flex: 3, child: Text("9485729485752748FF"))
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
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 18),
              child: Row(
                children: [
                  Expanded(
                    child: Text("Activity Name"),
                  ),
                  Expanded(
                      flex: 3,
                      child: Text("Seawater Fishhole Sidefilling 0-3 mtr"))
                ],
              ),
            )
          ],
        ));
  }
}
