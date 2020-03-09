import 'package:flutter/material.dart';
import 'package:job_card/global_keys.dart';
import 'package:job_card/screens/job_card_tab/approved_page.dart';
import 'package:job_card/screens/job_card_tab/detailed_job_card_page.dart';
import 'package:job_card/screens/job_card_tab/in_progress_page.dart';
import 'package:job_card/screens/job_card_tab/my_job_card_home_page.dart';
import 'package:job_card/screens/job_card_tab/not_started_page.dart';
import 'package:job_card/screens/job_card_tab/waiting_for_approval_page.dart';

class MyJobCardRoot extends StatefulWidget {
  // MyJobCardRootPage({Key myJobCardRootPageKey}) : super(key: myJobCardRootPageKey);
  @override
  _MyJobCardRootState createState() => _MyJobCardRootState();
}

class _MyJobCardRootState extends State<MyJobCardRoot> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: RouterGeneratorForJobCard.generateRoute,
      key: myJobCardRootPageKey,
      initialRoute: '/my_job_card_home_page',
    );
  }
}

class RouterGeneratorForJobCard {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(args);
    switch (settings.name) {
      case '/my_job_card_home_page':
        return MaterialPageRoute(
            builder: (_) => MyJobCardsHomePage(), settings: settings);

      case '/not_started_page':
        return MaterialPageRoute(
            builder: (_) => NotStartedPage(), settings: settings);

      case '/in_progress_page':
        return MaterialPageRoute(
            builder: (_) => InProgressPage(), settings: settings);

      case '/waiting_for_approval_page':
        return MaterialPageRoute(
            builder: (_) => WaitingForApprovalPage(), settings: settings);

      case '/approved_page':
        return MaterialPageRoute(
            builder: (_) => ApprovedPage(), settings: settings);
      case '/temp':
        return MaterialPageRoute(
            builder: (_) => DetailedJobCardPage(), settings: settings);

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
