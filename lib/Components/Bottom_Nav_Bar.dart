import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int currentTab;
  final Function onSelectTab;
  const BottomNavigation(
      {Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 28,
        selectedItemColor: CustomColors.Secondary,
        unselectedItemColor: CustomColors.Icon_not_selected,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: widget.currentTab,
        onTap: (i) {
          widget.onSelectTab(i);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.sim_card_sharp), label: "Job Cards"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Remarks"),
          BottomNavigationBarItem(icon: CircleAvatar(), label: "Account"),
        ]);
  }
}
