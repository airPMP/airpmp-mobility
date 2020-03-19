part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginWaiting extends LoginState {}

class LoginSubmitted extends LoginState {
  final bool loginStatus;
  final LoginDetails loginDetails;
  LoginSubmitted({@required this.loginStatus, this.loginDetails});
}

class LogedIn extends LoginState {}
