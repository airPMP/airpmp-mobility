import 'package:flutter/material.dart';

class StageCard extends StatelessWidget {
  final Icon icon;
  final Text text;
  final Function onPressed;
  const StageCard(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15.0),
      child: AspectRatio(
        aspectRatio: 1.4,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/appBarBG.png"),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.task, size: 30, color: Colors.white),
                    ),
                    Text("Not Started"),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}