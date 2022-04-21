import 'package:flutter/material.dart';

class PasswordFieldValidator{
  static String? validate(String password){
   return password.isEmpty || RegExp(r'^[a-z A-Z]+[0-9]+$').hasMatch(password)
       ? 'Password must contain letters and numbers' : null;
  }
}
class PasswordField extends StatelessWidget {
   PasswordField({
    Key? key,
    required this.focusNode,
    required this.passwordController,
    required this.label,
     required this.isObscure
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController passwordController;
  final String label;
  bool isObscure = true;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 52.00),
    child: TextFormField(
      controller: passwordController,
      style: TextStyle(color: Colors.grey),
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: IconButton(
            icon: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
                isObscure = !isObscure;
                (context as Element).markNeedsBuild();
            }
        ),
      ),
      validator: (password) => PasswordFieldValidator.validate(password!),
    ),
    );
  }
}