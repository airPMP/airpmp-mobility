import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/constants/fonts.dart';
import 'package:flutter/material.dart';

class AddEmployeeCard extends StatelessWidget {
  const AddEmployeeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // the deice is a Phone
    //if (w < 600) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: w < 600 ? w * .9 : w * 0.4,
        padding: EdgeInsets.all(25),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          border: new Border(
            top: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "ID: 18012",
                style: CustomTextStyles.subtitle,
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Sameerah Yousaf Shah',
                style: CustomTextStyles.subtitle,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Hour(s)",
                hintStyle: CustomTextStyles.hintTextStyle,
              ),
              textAlignVertical: TextAlignVertical.bottom,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Remarks",
                hintStyle: CustomTextStyles.hintTextStyle,
              ),
              textAlignVertical: TextAlignVertical.bottom,
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child:
                          Text("cancel", style: CustomTextStyles.buttongreen),
                    ),
                    SizedBox(
                      width: w * 0.07,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff57D1AF)),
                      ),
                      onPressed: () {},
                      child: Text("Add to List",
                          style: CustomTextStyles.whiteSubtitle),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
    //}
    // the device is a tablet
    // else {
    //   return Card(
    //     elevation: 8,
    //     shadowColor: Colors.black,
    //     shape: RoundedRectangleBorder(
    //       side: BorderSide(color: Colors.white70, width: 1),
    //       borderRadius: BorderRadius.circular(15),
    //     ),
    //     child: Container(
    //       padding: EdgeInsets.all(25),
    //       alignment: Alignment.topLeft,
    //       decoration: BoxDecoration(
    //         border: new Border(
    //           top: BorderSide(
    //             color: Colors.white,
    //             width: 3.0,
    //           ),
    //         ),
    //       ),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [],
    //       ),
    //     ),
    //   );
    // }
  }
}
