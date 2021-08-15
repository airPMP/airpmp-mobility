import 'package:airpmp_mobility/Components/Bottom_Nav_Bar.dart';
import 'package:airpmp_mobility/Components/Side_Nav_Bar.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:flutter/material.dart';

import '../tabNavigator.dart';
import 'account.dart';

class MainApp extends StatefulWidget {
  final bool isTab;
  MainApp({required this.isTab});

  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  int currentTab = 1;
  Stage stage = Stage.Not_Started;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
  };
  void _selectTab(int tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  void _selectStage(Stage st) {
    setState(() {
      stage = st;
    });
  }

  Color? _getColor(int tab) {
    return tab == currentTab
        ? CustomColors.secondary
        : CustomColors.icon_not_selected;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[currentTab]!.currentState!.maybePop(),
      child: widget.isTab
          ?
          // Side Nav menu of tablet
          Scaffold(
              body: Row(
                children: [
                  // Side Navigation Rail
                  // Navigation rail Widget not used due to the lack of proper trailing property
                  Container(
                    color: CustomColors.primary,
                    child: Column(
                      children: [
                        Container(
                            width: 100,
                            margin: EdgeInsets.symmetric(vertical: 25),
                            child: Image.asset("assets/images/airpmo.png")),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: IconButton(
                            icon: Icon(Icons.dashboard, color: _getColor(0)),
                            onPressed: () {
                              _selectTab(0);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: IconButton(
                            icon: Icon(Icons.workspaces, color: _getColor(1)),
                            onPressed: () {
                              _selectTab(1);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: IconButton(
                            icon: Icon(Icons.edit, color: _getColor(2)),
                            onPressed: () {
                              _selectTab(2);
                            },
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: IconButton(
                            icon: Icon(Icons.person, color: _getColor(3)),
                            onPressed: () {
                              _selectTab(3);
                            },
                          ),
                        )
                      ],
                    ),
                  ),

                  // Below given is the side menu to acces different stages (Not Started, In Progress...)
                  // It should be shown only if job cards is selected.
                  if (currentTab == 1)
                    Expanded(
                        flex: 30,
                        child: SideNavBar(
                          isTab: true,
                          stage: stage,
                          onchanged: _selectStage,
                        )),
                  Expanded(
                      flex: currentTab == 1 ? 78 : 108,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Stack(children: <Widget>[
                          _buildDashBoard(0),
                          _buildOffstageNavigator(1, stage),
                          _buildRemarks(2),
                          _buildAccount(3),
                        ]),
                      ))
                ],
              ),
            )
          :

          // Bottom Nav bar of Phone
          Scaffold(
              body: Stack(children: <Widget>[
                _buildDashBoard(0),
                _buildOffstageNavigator(1, null),
                _buildRemarks(2),
                _buildAccount(3),
              ]),
              bottomNavigationBar: BottomNavigation(
                currentTab: currentTab,
                onSelectTab: _selectTab,
              ),
            ),
    );
  }

  Widget _buildOffstageNavigator(int tabItem, Stage? st) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: CustomNavigator(
        isTab: widget.isTab,
        navigatorKey: navigatorKeys[tabItem]!,
        tabItem: tabItem,
        stage: st,
      ),
    );
  }

  Widget _buildDashBoard(int tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: Container(
          child: Center(
        child: Text("The DashBoard!",
            style: TextStyle(
              fontSize: 30,
            )),
      )),
    );
  }

  Widget _buildRemarks(int tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: Container(
          child: Center(
        child: Text("The Remarks Page!",
            style: TextStyle(
              fontSize: 30,
            )),
      )),
    );
  }

  Widget _buildAccount(int tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: AccountPage(),
    );
  }
}
