import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

abstract class CustomTextStyles {
  static const TextStyle title =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
  static const TextStyle subtitle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
  static const TextStyle whiteSubtitle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white);
  static const whiteTitle = TextStyle(
      fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle listTileTitle = TextStyle();
  static const TextStyle appbarTitle = TextStyle();
  static const TextStyle buttonText =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle hintTextStyle =
      TextStyle(fontSize: 16, color: Color(0xffC1C1C1));
  static const TextStyle buttongreen = TextStyle(
      color: Color(0xff57D1AF), fontSize: 16, fontWeight: FontWeight.w600);
}
