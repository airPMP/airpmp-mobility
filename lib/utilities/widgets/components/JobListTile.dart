import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:flutter/material.dart';

class JobListTile extends StatelessWidget {
  const JobListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        decoration: BoxDecoration(
            color: CustomColors.primary,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 60,
                child: Center(
                  child: Text("0.14.0"),
                ),
              ),
              VerticalDivider(),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "Seawater Fishhole Sidefilling 0-3 mtr Seawater Fishhole Sidefilling 0-3 mtr"),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
