import 'package:flutter/material.dart';

class LoaderDots extends StatelessWidget {
  const LoaderDots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/Loading.gif",
      fit: BoxFit.fill,
    );
  }
}
