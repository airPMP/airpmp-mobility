import 'package:airpmp_mobility/screens_new/account.dart';
import 'package:airpmp_mobility/screens_new/job_screen.dart';
import 'package:airpmp_mobility/utilities/constants/enums.dart';
import 'package:airpmp_mobility/test_page.dart';
import 'package:flutter/material.dart';
// import 'package:job_card/route_generator.dart';
import './screens_new/login.dart';
import 'screens_new/actualEmployees.dart';
import 'screens_new/main_screen.dart';
import 'tabNavigator.dart';
import 'utilities/widgets/bottomNavBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Rubik",
          inputDecorationTheme: InputDecorationTheme(),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Color(0xFFF4442E)),
          appBarTheme: AppBarTheme(
            color: Color(0xFFF4442E),
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: TextTheme(
              headline1: TextStyle(color: Colors.black),
            ),
          ),
        ),
        home: HomeApp()
        // routes: {
        //   "not_Started_Screen": (context) => MainPage(stage: Stage.Not_Started),
        //   "in_Progress_Screen": (context) => MainPage(stage: Stage.In_Progress),
        //   "waiting_For_Approval_Screen": (context) =>
        //       MainPage(stage: Stage.Waiting),
        //   "approved_Screen": (context) => MainPage(stage: Stage.Approved),
        //   "job_Card_Screen": (context) => JobPage(),
        //   "actual_Employees": (context) =>
        //       ActualResources(resource: Resource.Employee),
        //   "actual_Equipments": (context) =>
        //       ActualResources(resource: Resource.Equipment),
        //   "login": (context) => LoginPage(),
        //   "account": (context) => AccountPage()
        // },
        // initialRoute: "login", // onGenerateRoute: RouterGenerator.generateRoute,
        // initialRoute: '/resource_page',
        );
  }
}

class HomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
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
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
