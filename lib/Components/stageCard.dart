import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:flutter/material.dart';

class StageCard extends StatelessWidget {
  final Stage stage;
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const StageCard(
      {Key? key,
      required this.stage,
      required this.icon,
      required this.onPressed,
      required this.text})
      : super(key: key);

  String? _stageToFile() {
    String f = "assets/images/";
    switch (stage) {
      case Stage.Not_Started:
        f += "Not_Started";
        break;
      case Stage.In_Progress:
        f += "In_Progress";
        break;
      case Stage.Waiting:
        f += "Waiting";
        break;
      case Stage.Approved:
        f += "Approved";
        break;
    }
    f += ".png";
    return f;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10.0),
      child: AspectRatio(
        aspectRatio: 1.4,
        child: Card(
          shadowColor: Colors.white,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage(_stageToFile()!), fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(icon, size: 30, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(text,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
