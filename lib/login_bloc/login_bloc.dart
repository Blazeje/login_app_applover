import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is Login){
        if (event.userEmail.isEmpty || event.password.isEmpty){
          emit(LoginError());
        }else{
          emit(LoginLoading());
          await Future.delayed(const Duration(seconds: 2), (){
            emit(LoginLoaded(event.userEmail, event.password));
          });


        }
      }
    });
  }
}

