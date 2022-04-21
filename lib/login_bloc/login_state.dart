part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}

class LoginLoaded extends LoginState{
    final String userEmail;
    final String password;


    LoginLoaded(
        this.userEmail,
        this.password,
        );

}
class LoginError extends LoginState{}
