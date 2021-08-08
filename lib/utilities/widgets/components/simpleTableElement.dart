import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:flutter/material.dart';

class SimpleTableElement extends StatelessWidget {
  const SimpleTableElement({Key? key}) : super(key: key);

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
          Expanded(
            child: Container(
                child: Text(
              "rt",
              textAlign: TextAlign.center,
            )),
          ),
          Expanded(
            child: Container(
                child: Text(
              "rt",
              textAlign: TextAlign.center,
            )),
          ),
          Expanded(
            child: Container(
                child: Text(
              "rt",
              textAlign: TextAlign.center,
            )),
          ),
          Expanded(
            child: Container(
                child: Text(
              "rt",
              textAlign: TextAlign.center,
            )),
          ),
          Expanded(
            child: Container(
                child: Text(
              "rt",
              textAlign: TextAlign.center,
            )),
          ),
        ],
      ),
    );
  }
}
