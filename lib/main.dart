import 'package:applover_app/login/login_page.dart';
import 'package:applover_app/routes_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'success/success_page.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ThemeData().colorScheme.copyWith(
        primary: Colors.green,
      ),),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}



