import 'package:flutter/material.dart';

class StageCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  const StageCard(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.text})
      : super(key: key);

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
                      image: AssetImage("lib/assets/images/appBarBG.png"),
                      fit: BoxFit.cover)),
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
                          style: TextStyle(color: Colors.white, fontSize: 20)),
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
