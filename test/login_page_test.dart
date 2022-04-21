

import 'package:applover_app/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  Widget makeTestableWidget({required Widget child}){
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('', (WidgetTester tester) async {
    LoginPage page = LoginPage();

    await tester.pumpWidget(makeTestableWidget(child: page));
  });
}