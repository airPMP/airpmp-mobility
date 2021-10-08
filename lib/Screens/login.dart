import 'dart:convert';

import 'package:airpmp_mobility/API/ApiClass.dart';
import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Fonts_Styles.dart';
import 'package:airpmp_mobility/Models/ProviderModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
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
          "assets/images/bgsvg.svg",
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
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
                                      "assets/images/loginbgdesign.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: FractionallySizedBox(
                                heightFactor: 1,
                                widthFactor: 0.7,
                                child: LoginFields(),
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
          ),
        ),
      ],
    ));
  }
}

class LoginFields extends StatefulWidget {
  const LoginFields({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  String email = "", _password = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/images/airpmo.png"),
        // SvgPicture.asset(
        //   "assets/images/AIRPMO_2.svg",
        //   fit: BoxFit.contain,
        // ),
        Align(
            alignment: Alignment.centerLeft,
            child: Text("LOGIN", style: CustomTextStyles.Main_title)),
        Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Email or Mobile",
                hintStyle: CustomTextStyles.Hint_style,
              ),
              textAlignVertical: TextAlignVertical.bottom,
              onChanged: (text) {
                email = text;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: CustomTextStyles.Hint_style,
              ),
              textAlignVertical: TextAlignVertical.bottom,
              obscureText: true,
              onChanged: (text) {
                _password = text;
              },
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
              CustomColors.secondary,
            )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "LOGIN ",
                    style: CustomTextStyles.Button_subtitle,
                  ),
                  Icon(
                    Icons.send,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            onPressed: () async {
              //TODO: Loading Spinner
              LoginDetails log =
                  await ApiClass().login(username: email, password: _password);

              if (log.statuscode == 200) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChangeNotifierProvider<ProviderModel>(
                                create: (context) => ProviderModel(log),
                                child: MainApp(
                                    isTab: MediaQuery.of(context).size.width >
                                        700))));
              } else if (log.statuscode == 403) {
                print("Wrong Credentials...");
                //TODO: Display Wrong Credentials Message
              } else {
                print("Error");
                //TODO: Display error message
              }
            },
          ),
        )
      ],
    );
  }
}
