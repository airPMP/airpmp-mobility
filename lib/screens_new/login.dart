import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.green,
      // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(''))),
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
                    flex: 4,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: Colors.white,
                        child: FractionallySizedBox(
                          heightFactor: 0.8,
                          widthFactor: 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("airPMO"),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("LOGIN")),
                              Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Email or Mobile",
                                      hintStyle: TextStyle(fontSize: 14),
                                    ),
                                    textAlignVertical: TextAlignVertical.bottom,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(fontSize: 14),
                                    ),
                                    textAlignVertical: TextAlignVertical.bottom,
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    Color(
                                      0xff57d1af,
                                    ),
                                  )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Login ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        Icon(
                                          Icons.send,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ))),
                Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          /*    child: Container(
              child: Stack(
                children: [
                  Container(
                    child: Container(
                      width: 1194,
                      height: 834,
                      decoration: BoxDecoration(
                        color: Color(
                          0x7c000000,
                        ),
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                      ),
                    ),
                    width: 1194,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "bridged://url-reservation/image-hosting/29:0",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                    ),
                  ),

                  /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                  Container(),
                ],
              ),
              width: 834,
            ),
          ),

          /// wrap:positioned of "Group 10"
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      child: Container(
                        width: 777,
                        height: 531,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "bridged://url-reservation/image-hosting/28:90",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      width: 777,
                      decoration: BoxDecoration(
                        color: Color(
                          0xffefeffe,
                        ),
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                      ),
                    ),

                    /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                    Container(),
                  ],
                ),
                width: 531,
              ),
            ),
          ),

          /// wrap:positioned of "AIRPMO 2"
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 380,
                height: 111.76,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "bridged://url-reservation/image-hosting/28:78",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          /// wrap:positioned of "Email or Mobile"
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Email or Mobile",
                style: TextStyle(
                  color: Color(
                    0x8e545454,
                  ),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Rubik",
                ),
              ),
            ),
          ),

          /// wrap:positioned of "Password"
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Password",
                style: TextStyle(
                  color: Color(
                    0x8e545454,
                  ),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Rubik",
                ),
              ),
            ),
          ),

          /// wrap:positioned of "LOGIN"
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "LOGIN",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 29,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Rubik",
                ),
              ),
            ),
          ),

          /// wrap:positioned of "Vector 2"
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: 534,
                  height: 76,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// wrap:positioned of "Group"
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                child: Stack(
                  children: [
                    /// wrap:positioned of "Vector"
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Opacity(
                          opacity: 0.5,
                          child: Container(
                            width: 7.81,
                            height: 7.81,
                            decoration: BoxDecoration(
                              color: Color(
                                0xff545454,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        width: 25,
                        height: 17.19,
                        decoration: BoxDecoration(
                          color: Color(
                            0xff545454,
                          ),
                        ),
                      ),
                    ),

                    /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                    Container(),
                  ],
                ),
                width: 25,
                height: 17.19,
              ),
            ),
          ),

          /// wrap:positioned of "Group 11"
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: 117,
                      height: 49,
                      decoration: BoxDecoration(
                        color: Color(
                          0xff57d1af,
                        ),
                        borderRadius: BorderRadius.circular(
                          6,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Rubik",
                      ),
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
                    Container(),
                  ],
                ),
                width: 49,
                height: 117,
              ),
            ),
          ),

          /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
          Container(),*/
        ],
      ),
    ));
  }
}
