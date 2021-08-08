import 'package:airpmp_mobility/utilities/constants/colors.dart';
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
                "rt",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "fv",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "vc",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "dc",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "heading",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "heading",
                textAlign: TextAlign.center,
              )),
          Container(
              width: 80,
              child: Text(
                "heading",
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
