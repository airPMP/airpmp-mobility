// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:job_card/utilities/functions.dart';
// import 'package:meta/meta.dart';

// part 'landingpage_event.dart';
// part 'landingpage_state.dart';

// class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
//   @override
//   LandingPageState get initialState => LandingPageInitial();

//   @override
//   Stream<LandingPageState> mapEventToState(
//     LandingPageEvent event,
//   ) async* {
//     if (event is SetLandingPage) {
//       String token = await getSavedToken();

//       if (token == "token is null") {
//         print('setting page to login_page');
//         yield StartLoginPage();
//       } else {
//         print('setting page to basic_frame');
//         yield StartHomePage();
//       }
//     }
//   }
// }
