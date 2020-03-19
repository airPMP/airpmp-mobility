import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:job_card/models/login_response_model.dart';
import 'package:job_card/utilities/functions.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginWaiting();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login) {
      LoginDetails loginDetails;

      loginDetails =
          await login(email: event.userName, password: event.password);

      if (loginDetails == null) {
        yield LoginSubmitted(
          loginStatus: false,
          loginDetails: null,
        );
      } else {
        yield LoginSubmitted(
          loginStatus: true,
          loginDetails: loginDetails,
        );
      }
    }
  }
}
