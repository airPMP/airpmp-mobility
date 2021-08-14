import 'package:flutter/material.dart';

import '../tabNavigator.dart';
import '../utilities/constants/colors.dart';
import '../utilities/widgets/bottomNavBar.dart';
import '../utilities/widgets/tabSideNavMenu.dart';

class PhoneApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PhoneAppState();
}

class PhoneAppState extends State<PhoneApp> {
  int currentTab = 1;
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[currentTab]!.currentState!.maybePop(),
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
          _buildOffstageNavigator(3),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(int tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: CustomNavigator(
        isTab: false,
        navigatorKey: navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}

class TabApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabAppState();
}

class TabAppState extends State<TabApp> {
  int currentTab = 1;
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[currentTab]!.currentState!.maybePop(),
      child: Scaffold(
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
                      child: Image.asset("lib/assets/images/airpmo.png")),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Icon(Icons.dashboard,
                        color: CustomColors.icon_not_selected),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Icon(Icons.card_giftcard_outlined,
                        color: CustomColors.secondary),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child:
                        Icon(Icons.edit, color: CustomColors.icon_not_selected),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Icon(Icons.settings_outlined,
                        color: CustomColors.icon_not_selected),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Icon(Icons.logout,
                        color: CustomColors.icon_not_selected),
                  )
                ],
              ),
            ),

            Expanded(flex: 30, child: SideNavMenu()),
            Expanded(
                flex: 78,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(children: <Widget>[
                    _buildOffstageNavigator(0),
                    _buildOffstageNavigator(1),
                    _buildOffstageNavigator(2),
                    _buildOffstageNavigator(3),
                  ]),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(int tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: CustomNavigator(
        isTab: true,
        navigatorKey: navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
