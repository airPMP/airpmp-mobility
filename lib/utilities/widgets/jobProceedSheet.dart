import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:flutter/material.dart';

import 'components/roundedButton.dart';

class JobProceedSheet extends StatelessWidget {
  final VoidCallback onClosed;
  const JobProceedSheet({Key? key, required this.onClosed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Floating button has a default padding from right and bottom, so left padding should be adjusted to that
      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
      height: 300,
      decoration: BoxDecoration(
          color: CustomColors.secondary,
          borderRadius: BorderRadius.circular(24)),
      //outer column containing the proceed and close button, with the main column
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Main Column
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text part of main Column
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        " JC Executed ",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Qty to be achived",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Qty achived",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
                // Text Field part of main column
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white),
                        Container(width: 80, child: TextField())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleButton(
                            icon: Icon(Icons.remove,
                                color: CustomColors.secondary)),
                        Container(width: 50, child: TextField()),
                        CircleButton(
                            icon:
                                Icon(Icons.add, color: CustomColors.secondary))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleButton(
                            icon: Icon(Icons.remove,
                                color: CustomColors.secondary)),
                        Container(width: 50, child: TextField()),
                        CircleButton(
                            icon:
                                Icon(Icons.add, color: CustomColors.secondary))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      child: Text(
                        "Proceed",
                        style: TextStyle(
                            fontSize: 18, color: CustomColors.secondary),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  CircleButton(
                    onPressed: onClosed,
                    icon: Icon(Icons.close, color: CustomColors.secondary),
                    bgColor: Colors.white,
                  )
                ]),
          )
        ],
      ),
    );
  }
}
