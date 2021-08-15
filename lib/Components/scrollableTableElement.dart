import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:flutter/material.dart';

class ScrollableTableElement extends StatelessWidget {
  const ScrollableTableElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: CustomColors.primary),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              width: 80,
              child: Text(
                "Carpenter",
                textAlign: TextAlign.center,
              )),
          VerticalDivider(),
          Container(
              width: 80,
              child: Text(
                "0.833",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "8.33",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "0.7",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "49.678",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "0.8333",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "0.8333",
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
