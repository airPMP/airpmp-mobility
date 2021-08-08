// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_card/basic_frame.dart';
// import 'package:job_card/bloc/landing_page_bloc/landingpage_bloc.dart';
// import 'package:job_card/screens/login_page.dart';
// import 'package:job_card/utilities/widgets.dart';

// class LandingPage extends StatefulWidget {
//   @override
//   _LandingPageState createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage> {
//   LandingPageBloc _landingPageBloc = LandingPageBloc();
//   @override
//   void initState() {
//     _landingPageBloc.dispatch(SetLandingPage());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(
//       bloc: _landingPageBloc,
//       builder: (BuildContext context, LandingPageState state) {
//         if (state is LandingPageInitial) {
//           return Scaffold();
//         } else if (state is StartLoginPage) {
//           return LoginPage();
//         } else if (state is StartHomePage) {
//           return BasicFrame();
//         }
//         return stateError();
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _landingPageBloc.dispose();
//     super.dispose();
//   }
// }
