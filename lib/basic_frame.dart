// import 'package:flutter/material.dart';
// import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
// import 'package:job_card/screens/job_card_tab/my_job_cards_root.dart';
// import 'package:job_card/screens/my_dash_board.dart';
// import 'package:job_card/screens/my_remarks.dart';

// class Tabs {
//   final IconData icon;
//   final String title;
//   final Color color;

//   Tabs(this.icon, this.title, this.color);
// }

// class BasicFrame extends StatefulWidget {
//   @override
//   BasicFrameState createState() => BasicFrameState();
// }

// class BasicFrameState extends State<BasicFrame>
//     with SingleTickerProviderStateMixin {
//   // tab property configuration
//   Color inactiveTabColor = Colors.grey;
//   // by default screen will be landed on index 0 ie MyDashBoardPage()
//   static int selectedScreenTab = 1;
//   TabController? tabBarController;

//   // where each tab should direct to
//   List<Widget> tabScreens = [
//     MyDashBoardPage(),
//     MyJobCardRoot(),
//     MyRemarksPage()
//   ];

//   // configuration of tab icons and its color
//   List<Tabs> tabsIcons = [
//     Tabs(Icons.dashboard, "Dashboard", Colors.black),
//     Tabs(Icons.chrome_reader_mode, "Job Card", Colors.black),
//     Tabs(Icons.edit, "Remarks", Colors.black),
//   ];

//   // length property is given here (3)
//   @override
//   void initState() {
//     super.initState();
//     tabBarController =
//         TabController(initialIndex: selectedScreenTab, length: 3, vsync: this);
//   }

//   @override
//   Widget build(BuildContext basicFrameContext) {
//     return Scaffold(
//         // key: basicFrameKey,
//         bottomNavigationBar: CubertoBottomBar(
//           // barBackgroundColor: Color(0xFFF4442E),
//           barShadow: [],
//           padding: EdgeInsets.symmetric(vertical: 10),
//           inactiveIconColor: inactiveTabColor,
//           tabStyle: CubertoTabStyle.STYLE_FADED_BACKGROUND,
//           selectedTab: selectedScreenTab,
//           tabs: tabsIcons
//               .map((value) => TabData(
//                     iconData: value.icon,
//                     title: value.title,
//                     tabColor: value.color,
//                   ))
//               .toList(),
//           onTabChangedListener: (position, title, color) {
//             setState(() {
//               tabBarController.animateTo(position);
//               selectedScreenTab = position;
//             });
//           },
//         ),
//         body: IndexedStack(
//           children: tabScreens,
//           index: selectedScreenTab,
//         )
//         // tabScreens[selectedScreenTab],
//         );
//   }
// }
