import 'package:app_jefferson/screens/Exponent/signin/signup_screen/signin_screen.dart';
import 'package:app_jefferson/screens/Home/HomeScreenn.dart';
import 'package:app_jefferson/screens/root/root.dart';
import 'package:app_jefferson/service/currentUser.dart';
import 'package:app_jefferson/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordCOntroller = TextEditingController();

  void LoginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString = await _currentUser.loginUser(email, password);
      if (_returnString == "Success") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => OurRoot()),
            (route) => false);
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
              child: Text(
                "Log in",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 119, 124, 135)),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a email";
                }
              },
              controller: _emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a password";
                }
              },
              controller: _passwordCOntroller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
              obscureText: true,
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  LoginUser(
                      _emailController.text, _passwordCOntroller.text, context);
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Text(
                  "Log in",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              color: Color.fromARGB(255, 119, 124, 135),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SigninScreen()));
              },
              child: Text("Don't have an account? Sign up here"),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            )
          ],
        ),
      ),
    );
  }
}
