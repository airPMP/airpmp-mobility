import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/constants/fonts.dart';
import 'package:airpmp_mobility/utilities/widgets/components/AddEmpdropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          "lib/assets/images/bgsvg.svg",
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 9,
                    child: AddEmpDropDown(),
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ],
    ));
  }
}
