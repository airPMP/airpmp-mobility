import 'package:airpmp_mobility/screens_new/job_screen.dart';
import 'package:airpmp_mobility/screens_new/main_screen.dart';
import 'package:airpmp_mobility/utilities/constants/enums.dart';
import 'package:flutter/material.dart';

import 'screens_new/account.dart';
import 'screens_new/actualEmployees.dart';
import 'screens_new/login.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String jobscreen = '/job_screen';
  static const String empscreen = '/emp_screen';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final int tabItem;

  void _push(
    BuildContext context,
    String path,
  ) {
    Map routeBuilders = _routeBuilders(context);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => routeBuilders[path](context)));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      "not_Started_Screen": (context) =>
          MainPage(stage: Stage.Not_Started, onPush: _push),
      "in_Progress_Screen": (context) =>
          MainPage(stage: Stage.In_Progress, onPush: _push),
      "waiting_For_Approval_Screen": (context) =>
          MainPage(stage: Stage.Waiting, onPush: _push),
      "approved_Screen": (context) =>
          MainPage(stage: Stage.Approved, onPush: _push),
      "job_Card_Screen": (context) => JobPage(onPush: _push),
      "actual_Employees": (context) =>
          ActualResources(resource: Resource.Employee, onPush: _push),
      "actual_Equipments": (context) =>
          ActualResources(resource: Resource.Equipment, onPush: _push),
      "login": (context) => LoginPage(),
      "account": (context) => AccountPage()
    };
  }

  @override
  Widget build(BuildContext context) {
    Map routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: "not_Started_Screen",
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}
