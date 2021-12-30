import 'package:airpmp_mobility/API/ResourceClasses.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:flutter/material.dart';

class ScrollableTableElement extends StatelessWidget {
  final PlannedvsActualResource res;
  const ScrollableTableElement({Key? key, required this.res}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: CustomColors.primary),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Container(
              width: 80,
              child: Text(
                res.designation,
                textAlign: TextAlign.center,
              )),
          VerticalDivider(),
          Container(
              width: 80,
              child: Text(
                res.allowableResources == null
                    ? "-"
                    : res.allowableResources!.toStringAsFixed(2),
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                res.allowableTotHrs == null
                    ? "-"
                    : res.allowableTotHrs!.toStringAsFixed(2),
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                res.actualTotHours,
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                res.actualTotCost.toStringAsFixed(2),
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                res.spi.toStringAsFixed(2),
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                res.cpi.toStringAsFixed(2),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
