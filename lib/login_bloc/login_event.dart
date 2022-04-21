part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent{
  var userEmail;
  var password;

  Login(this.password, this.userEmail);
}
