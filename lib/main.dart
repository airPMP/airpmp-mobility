import 'package:flutter/material.dart';
import 'package:job_card/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Color(0xFFF4442E)),
        appBarTheme: AppBarTheme(
          color: Color(0xFFF4442E),
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            title: TextStyle(color: Colors.black),
          ),
        ),
      ),
      onGenerateRoute: RouterGenerator.generateRoute,
      initialRoute: '/resource_page',
    );
  }
}
