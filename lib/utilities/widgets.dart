import 'package:flutter/material.dart';
import 'package:job_card/utilities/constants.dart';

Widget clickableCard(
    GlobalKey<NavigatorState> key, String routeName, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: GestureDetector(
      onTap: () {
        key.currentState.pushNamed(routeName);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black12,
                offset: Offset(0, 3),
              )
            ]),
        padding: EdgeInsets.all(20),
        height: 70,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: heading1,
          ),
        ),
      ),
    ),
  );
}

// THE DROP DOWN LIST FOR SELECTING BY DATE OR ALL
// the parameter onChangedFunction should return void and accept a string.
// usually onChangeFunction will be a setState function to change the
// variable of that class to the selected value
DropdownButton dropDownByDateOrAll(
    String isByDateOrAll, Function onChangedFunction) {
  return DropdownButton<String>(
    underline: Divider(
      color: Colors.transparent,
    ),
    items: [
      DropdownMenuItem(
        value: "Date",
        child: Text(
          "Date",
        ),
      ),
      DropdownMenuItem(
        value: "Week",
        child: Text(
          "Week",
        ),
      ),
      DropdownMenuItem(
        value: "Month",
        child: Text(
          "Month",
        ),
      ),
      DropdownMenuItem(
        value: "Quarter",
        child: Text(
          "Quarter",
        ),
      ),
      DropdownMenuItem(
        value: "Year",
        child: Text(
          "Year",
        ),
      ),DropdownMenuItem(
        value: "All",
        child: Text(
          "All",
        ),
      ),
    ],
    onChanged: onChangedFunction,
    value: isByDateOrAll,
  );
}
