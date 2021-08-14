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
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: widget.currentTab,
        onTap: (i) {
          widget.onSelectTab(i);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "ssg"),
          BottomNavigationBarItem(
              icon: Icon(Icons.workspaces), label: "dfdhdh"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "gdtt"),
          BottomNavigationBarItem(icon: CircleAvatar(), label: "gdtt"),
        ]);
  }
}
