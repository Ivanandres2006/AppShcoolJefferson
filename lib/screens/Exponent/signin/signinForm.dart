import 'package:app_jefferson/models/user.dart';
import 'package:app_jefferson/service/currentUser.dart';
import 'package:app_jefferson/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> signUpUSer(String email, String password, String fullName,
      String year, BuildContext context) async {
    CurrentUser _currentUser = Provider.of(context, listen: false);

    try {
      String _returnString =
          await _currentUser.signUpUser(email, password, fullName, year);
      if (_returnString == "Success") {
        Navigator.pop(context);
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

  final List<String> sugars = [
    '4to Año',
  ];

  String? _currentValue;

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
                "Sign Up",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 119, 124, 135)),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a name";
                }
              },
              controller: _fullNameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: "Full Name"),
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                value: _currentValue,
                items: sugars.map((sugar) {
                  return DropdownMenuItem(
                    value: sugar,
                    child: Text(sugar),
                  );
                }).toList(),
                onChanged: (String? val) => setState(() => _currentValue = val),
                hint: Text("Year"),
                elevation: 5,
              ),
            ),
            SizedBox(
              height: 24.0,
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
              height: 26.8,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a password";
                }
              },
              controller: _passwordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
              obscureText: true,
            ),
            SizedBox(
              height: 25.0,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter the password";
                }
              },
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_open_outlined),
                  hintText: "Confirm Password"),
              obscureText: true,
            ),
            SizedBox(
              height: 25.0,
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_passwordController.text ==
                      _confirmPasswordController.text) {
                    signUpUSer(_emailController.text, _passwordController.text,
                        _fullNameController.text, _currentValue!, context);
                  } else {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Password do not match"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
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
          ],
        ),
      ),
    );
  }
}
