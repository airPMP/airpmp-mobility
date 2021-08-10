import 'package:flutter/material.dart';

abstract class CustomTextStyles {
  static const TextStyle title =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 25);
  static const whiteTitle =
      TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle listTileTitle = TextStyle();
  static const TextStyle appbarTitle = TextStyle();
  static const TextStyle buttonText =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle hintTextStyle = TextStyle(fontSize: 14);
}
