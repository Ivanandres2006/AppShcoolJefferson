import 'package:app_jefferson/screens/Exponent/login/loginForm.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                SizedBox(
                  height: 166.0,
                ),
                LoginForm()
              ],
            ),
          )
        ],
      ),
    );
  }
}
