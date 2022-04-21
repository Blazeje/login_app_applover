import 'package:applover_app/login_bloc/login_bloc.dart';
import 'package:applover_app/success_bloc/success_bloc.dart';
import 'package:applover_app/success/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/login_page.dart';

class RouteGenerator {
  final LoginBloc _loginBloc = LoginBloc();
  final SuccessBloc _successBloc = SuccessBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>.value(
            value: _loginBloc,
            child: const LoginPage(),
          ),
        );

      case '/success':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<SuccessBloc>.value(
              value: _successBloc,
              child: SuccessPage(userEmail: args,),
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('ERROR IN NAVIGATION'),
        ),
      );
    });
  }
}