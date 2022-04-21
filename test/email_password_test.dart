import 'package:applover_app/login/email_field.dart';
import 'package:applover_app/login/password_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('empty email returns error string', () {

    final result = EmailFieldValidator.validate('');
    expect(result, 'Enter correct email');
  });

  test('non-empty email returns null', () {

    final result = EmailFieldValidator.validate('email@gmail.com');
    expect(result, null);
  });

  test('empty password returns error string', () {

    final result = PasswordFieldValidator.validate('');
    expect(result, 'Password must contain letters and numbers');
  });

  test('non-empty password returns null', () {

    final result = PasswordFieldValidator.validate('password');
    expect(result, null);
  });
}