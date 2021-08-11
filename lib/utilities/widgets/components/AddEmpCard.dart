import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:flutter/material.dart';

class AddEmployeeCard extends StatelessWidget {
  const AddEmployeeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // the deice is a Phone
    if (w < 600) {
      return Container(
        child: null,
      );
    } 
    // the device is a tablet
    else {
      return Container(
        child: null,
      );
    }
  }
}
