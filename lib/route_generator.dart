import 'package:flutter/material.dart';
import 'package:job_card/basic_frame.dart';
import 'package:job_card/screens/job_card_tab/my_job_card_home_page.dart';
import 'package:job_card/screens/landing_page.dart';
import 'package:job_card/screens/login_page.dart';
import 'package:job_card/screens/my_dash_board.dart';
import 'package:job_card/screens/select_project_page.dart';
import 'package:job_card/test_page.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(args);
    switch (settings.name) {
      case '/landing_page':
        return MaterialPageRoute(builder: (_) => LandingPage());

      case '/basic_frame':
        return MaterialPageRoute(builder: (_) => BasicFrame());

      case '/login_page':
        return MaterialPageRoute(builder: (_) => LoginPage());

      case '/select_project':
        return MaterialPageRoute(builder: (_) => SelectProject());

      case '/my_dash_board':
        return MaterialPageRoute(builder: (_) => MyDashBoardPage());

      case '/my_job_cards':
        return MaterialPageRoute(builder: (_) => MyJobCardsHomePage());

      case '/test_page':
        return MaterialPageRoute(builder: (_) => TestPage());

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          body: Center(
        child: Text('Error'),
      ));
    });
  }
}
