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
        home: LoginPage());
  }
}
