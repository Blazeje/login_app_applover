import 'package:applover_app/login/email_field.dart';
import 'package:applover_app/login/password_field.dart';
import 'package:applover_app/login_bloc/login_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  late FocusNode userEmailFocus;
  late FocusNode passwordFocus;
  late FocusNode loginBtnFocus;
  late TextEditingController userEmail;
  late TextEditingController password;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userEmailFocus = FocusNode();
    passwordFocus = FocusNode();
    loginBtnFocus = FocusNode();
    userEmail = TextEditingController();
    password = TextEditingController();
  }
  @override
  void dispose(){
    userEmailFocus.dispose();
    passwordFocus.dispose();
    loginBtnFocus.dispose();
    userEmail.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1c1c),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
          } else if (state is LoginLoaded) {
            clearTextData();
            Navigator.of(context)
                .pushNamed('/success', arguments: state.userEmail);
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return LoadingWidget(child: buildInitialInput());
          } else {
            return buildInitialInput();
          }
        },
      ),
    );
  }
  Widget buildInitialInput() => SingleChildScrollView(
    padding: EdgeInsets.all(10),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 100),
        Image.asset('assets/applover.png'),
        SizedBox(height: 10),
        Text(
          "Login",
          style: TextStyle(fontSize: 30.0, color: Colors.grey),

        ),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: EmailField(
            focusNode: userEmailFocus,
            textController: userEmail,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PasswordField(
            focusNode: passwordFocus,
            passwordController: password,
            label: "Password",
            isObscure: true,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _loginButton(),
        ),
      ],
      ),
    ),
  );


  clearTextData() {
    userEmail.clear();
    password.clear();
  }


Widget _loginButton() {
  return ElevatedButton(
    onPressed: (){
      final form = formKey.currentState!;
      if(form.validate()) {
        BlocProvider.of<LoginBloc>(context)
            .add(Login(userEmail.text, password.text));
      }
    },
    style: ElevatedButton.styleFrom(
      primary: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
    ),
    child: Text('Login'),
  );
}
}

