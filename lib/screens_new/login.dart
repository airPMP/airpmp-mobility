import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/constants/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
import 'phoneApp.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
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
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "lib/assets/images/loginbgdesign.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: FractionallySizedBox(
                            heightFactor: 1,
                            widthFactor: 0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("lib/assets/images/airpmo.png"),
                                // SvgPicture.asset(
                                //   "lib/assets/images/AIRPMO_2.svg",
                                //   fit: BoxFit.contain,
                                // ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("LOGIN",
                                        style: CustomTextStyles.title)),
                                Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: "Email or Mobile",
                                        hintStyle:
                                            CustomTextStyles.hintTextStyle,
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            CustomTextStyles.hintTextStyle,
                                      ),
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                      CustomColors.secondary,
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "LOGIN ",
                                            style: CustomTextStyles.buttonText,
                                          ),
                                          Icon(
                                            Icons.send,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      if (MediaQuery.of(context).size.width >
                                          700)
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TabApp()));
                                      else
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PhoneApp()));
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
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
