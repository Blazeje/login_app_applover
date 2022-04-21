import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailFieldValidator{
  static String? validate(String email){
    return email != null && !EmailValidator.validate(email)
        ? "Enter correct email"
        : null;
  }
}
class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required this.focusNode,
    required this.textController,

  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController textController;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 52.00),
  //    padding: EdgeInsets.all(10),
    child: TextFormField(
      controller: textController,
      style: TextStyle(color: Colors.grey),
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email address",
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      validator: (email) =>  EmailFieldValidator.validate(email!)
    ),
    );
  }
}