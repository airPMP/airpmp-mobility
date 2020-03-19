import 'package:flutter/material.dart';
import 'package:job_card/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // key: myAppKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Color(0xFFF4442E)),
        appBarTheme: AppBarTheme(
          color: Color(0xFFF4442E),
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
            title: TextStyle(color: Colors.black),
          ),
        ),
        // primarySwatch: Colors.deepOrangeAccent,
        // Color(0xFFF4442E),
      ),
      onGenerateRoute: RouterGenerator.generateRoute,
      initialRoute: '/landing_page',
    );
  }
}
