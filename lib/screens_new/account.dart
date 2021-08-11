import 'package:airpmp_mobility/utilities/constants/colors.dart';
import 'package:airpmp_mobility/utilities/constants/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0x00000000),
          title: Text(
            'Account',
            style: CustomTextStyles.whiteTitle,
          ),
        ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://completeconcussions.com/drive/uploads/2017/10/detail-john-doe.jpg'),
                                      radius: w * 0.15,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'John Doe',
                                        style: CustomTextStyles.title,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Architect',
                                        style: CustomTextStyles.subtitle,
                                      ),
                                    ),
                                    Container(
                                      width: w,
                                      padding: EdgeInsets.symmetric(
                                          vertical: w * 0.05,
                                          horizontal: w * 0.01),
                                      decoration: BoxDecoration(
                                        //color: Color(0xff57D1AF),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  'Project:',
                                                  style:
                                                      CustomTextStyles.subtitle,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  'Sama Al Jadaf Infrastructure Works DS135/2',
                                                  style:
                                                      CustomTextStyles.subtitle,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.05,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  'Company:',
                                                  style:
                                                      CustomTextStyles.subtitle,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  'airPMO',
                                                  style:
                                                      CustomTextStyles.subtitle,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.05,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  'Job Cards Assigned:',
                                                  style:
                                                      CustomTextStyles.subtitle,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  '7',
                                                  style:
                                                      CustomTextStyles.subtitle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
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
