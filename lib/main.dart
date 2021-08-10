import 'package:airpmp_mobility/screens_new/job_screen.dart';
import 'package:airpmp_mobility/utilities/constants/enums.dart';
import 'package:flutter/material.dart';
// import 'package:job_card/route_generator.dart';
import './screens_new/login.dart';
import 'screens_new/actualEmployees.dart';
import 'screens_new/main_screen.dart';

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
        home: ActualEmployees()
        // onGenerateRoute: RouterGenerator.generateRoute,
        // initialRoute: '/resource_page',
        );
  }
}
