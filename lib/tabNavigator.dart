import 'package:airpmp_mobility/screens_new/job_screen.dart';
import 'package:airpmp_mobility/screens_new/main_screen.dart';
import 'package:airpmp_mobility/screens_new/tab%20screens/tabMainScreen.dart';
import 'package:airpmp_mobility/utilities/constants/enums.dart';
import 'package:flutter/material.dart';

import 'screens_new/account.dart';
import 'screens_new/actualEmployees.dart';
import 'screens_new/login.dart';
import 'screens_new/tab screens/tabActualEmployees.dart';
import 'screens_new/tab screens/tabJobScreen.dart';

class CustomNavigator extends StatelessWidget {
  CustomNavigator(
      {required this.navigatorKey, required this.tabItem, this.isTab = false});
  final GlobalKey<NavigatorState> navigatorKey;
  final bool isTab;
  final int tabItem;

  void _push(
    BuildContext context,
    String path,
  ) {
    Map routeBuilders;
    if (isTab)
      routeBuilders = _tabRouteBuilders(context);
    else
      routeBuilders = _routeBuilders(context);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => routeBuilders[path](context)));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      "not_Started_Screen": (context) =>
          MainPagePhone(stage: Stage.Not_Started, onPush: _push),
      "in_Progress_Screen": (context) =>
          MainPagePhone(stage: Stage.In_Progress, onPush: _push),
      "waiting_For_Approval_Screen": (context) =>
          MainPagePhone(stage: Stage.Waiting, onPush: _push),
      "approved_Screen": (context) =>
          MainPagePhone(stage: Stage.Approved, onPush: _push),
      "job_Card_Screen": (context) => JobPagePhone(onPush: _push),
      "actual_Employees": (context) =>
          ActualResourcesPhone(resource: Resource.Employee, onPush: _push),
      "actual_Equipments": (context) =>
          ActualResourcesPhone(resource: Resource.Equipment, onPush: _push),
      "login": (context) => LoginPage(),
      "account": (context) => AccountPage()
    };
  }

  Map<String, WidgetBuilder> _tabRouteBuilders(BuildContext context) {
    return {
      "not_Started_Screen": (context) =>
          TabMainScreen(stage: Stage.Not_Started, onPush: _push),
      "in_Progress_Screen": (context) =>
          TabMainScreen(stage: Stage.In_Progress, onPush: _push),
      "waiting_For_Approval_Screen": (context) =>
          TabMainScreen(stage: Stage.Waiting, onPush: _push),
      "approved_Screen": (context) =>
          TabMainScreen(stage: Stage.Approved, onPush: _push),
      "job_Card_Screen": (context) => TabJobScreen(onPush: _push),
      "actual_Employees": (context) =>
          TabActualResources(resource: Resource.Employee, onPush: _push),
      "actual_Equipments": (context) =>
          TabActualResources(resource: Resource.Equipment, onPush: _push),
      "login": (context) => LoginPage(),
      "account": (context) => AccountPage()
    };
  }

  @override
  Widget build(BuildContext context) {
    Map routeBuilders;
    if (isTab)
      routeBuilders = _tabRouteBuilders(context);
    else
      routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: "not_Started_Screen",
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}

// class TabNavigator extends StatelessWidget {
//   TabNavigator({required this.navigatorKey, required this.tabItem});
//   final GlobalKey<NavigatorState> navigatorKey;
//   final int tabItem;

//   void _push(
//     BuildContext context,
//     String path,
//   ) {
//     Map routeBuilders = _routeBuilders(context);

//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => routeBuilders[path](context)));
//   }

//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
//     return {
//       "not_Started_Screen": (context) =>
//           MainPage(stage: Stage.Not_Started, onPush: _push),
//       "in_Progress_Screen": (context) =>
//           MainPage(stage: Stage.In_Progress, onPush: _push),
//       "waiting_For_Approval_Screen": (context) =>
//           MainPage(stage: Stage.Waiting, onPush: _push),
//       "approved_Screen": (context) =>
//           MainPage(stage: Stage.Approved, onPush: _push),
//       "job_Card_Screen": (context) => JobPage(onPush: _push),
//       "actual_Employees": (context) =>
//           ActualResources(resource: Resource.Employee, onPush: _push),
//       "actual_Equipments": (context) =>
//           ActualResources(resource: Resource.Equipment, onPush: _push),
//       "login": (context) => LoginPage(),
//       "account": (context) => AccountPage()
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     Map routeBuilders = _routeBuilders(context);

//     return Navigator(
//         key: navigatorKey,
//         initialRoute: "not_Started_Screen",
//         onGenerateRoute: (routeSettings) {
//           return MaterialPageRoute(
//               builder: (context) => routeBuilders[routeSettings.name](context));
//         });
//   }
// }
