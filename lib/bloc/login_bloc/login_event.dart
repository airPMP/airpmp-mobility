part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent {
  final String userName;
  final String password;
  
  Login({this.userName, this.password});
}
