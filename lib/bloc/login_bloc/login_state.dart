part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginWaitingForCredentials extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailed extends LoginState {}

class LogedIn extends LoginState {
  final LoginDetails loginDetails;
  LogedIn({@required this.loginDetails});
}
