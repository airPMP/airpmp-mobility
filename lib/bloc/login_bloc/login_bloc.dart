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
  LoginState get initialState => LoginWaitingForCredentials();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login) {
      yield LoginLoading();

      LoginDetails loginDetails =
          await login(email: event.userName, password: event.password);

      if (loginDetails == null) {
        yield LoginFailed();
      } else {
        await saveToken(loginDetails.token);
        await saveCompanyID(loginDetails.companyID);
        await saveUserID(loginDetails.userID);
        print("token, companyID, userID has been saved");

        yield LogedIn(loginDetails: loginDetails);
      }
    }
  }
}
