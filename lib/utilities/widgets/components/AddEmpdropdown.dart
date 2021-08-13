import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/constants/fonts.dart';
import 'package:flutter/material.dart';

class AddEmpDropDown extends StatelessWidget {
  const AddEmpDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
// <=====================================================================>

    List<String> id = [
      'ID00G31',
      'ID00G32',
      'ID00G33',
      'ID00G34',
      'ID00G35',
      'ID00G36',
      'ID00G37',
      'ID00G38',
      'ID00G39',
      'ID00G40',
      'ID00G41',
      'ID00G42',
      'ID00G43',
      'ID00G44',
      'ID00G45',
      'ID00G46',
      'ID00G47',
      'ID00G48',
      'ID00G49',
      'ID00G50'
    ];
    List<String> name = [
      'John Smith',
      'John Doe',
      'Jacob Dalton',
      'Jane Doe',
      'Jane Smith',
      'Jacob smith',
      'John Smith',
      'John Doe',
      'Jacob Dalton',
      'Jane Doe',
      'Jane Smith',
      'Jacob smith',
      'John Smith',
      'John Doe',
      'Jacob Dalton',
      'Jane Doe',
      'Jane Smith',
      'Jacob smith',
      'Jane Smith',
      'Jacob smith'
    ];

// <=====================================================================>
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
        width: w < 600 ? w * .2 : w * 0.4,
        height: h * 0.6,
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
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: CustomTextStyles.hintTextStyle,
              ),
              textAlignVertical: TextAlignVertical.bottom,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, i) {
                  return SizedBox(
                    height: 10,
                  );
                },
                scrollDirection: Axis.vertical,
                itemCount: id.length,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text(id[i], style: CustomTextStyles.listTileTitle),
                      ),
                      SizedBox(
                        width: w < 600 ? w * .1 : w * 0.4,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(name[i],
                            style: CustomTextStyles.listTileTitle),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
