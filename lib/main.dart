import 'package:flutter/material.dart';
import 'Screens/login.dart';

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
        home: LoginPage()
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
