import 'package:airpmp_mobility/Components/Side_Nav_Bar.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(Stage) onChanged;
  const CustomDrawer({Key? key, required this.onChanged}) : super(key: key);

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
          Expanded(child: SideNavBar(
            onchanged: (st) {
              onChanged(st);

              Navigator.pop(context);
            },
          )),
        ],
      ),
    );
  }
}
