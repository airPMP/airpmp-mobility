import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Project: Tabloviskey Halmikuttan Pi Asro",
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: Text("Not Started"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: Text("In Progress"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      child: Text("Waiting"),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Card(
                        child: Text("Approved"),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
