import 'package:app_jefferson/models/user.dart';
import 'package:app_jefferson/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  late OurUser _currentUser = OurUser();

  OurUser get getCurrentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String retVal = "error";

    try {
      User? _firebaseUser = _auth.currentUser;

      if (_firebaseUser != null) {
        _currentUser = await OurDatabase().getUserInfo(_firebaseUser.uid);
        if (_currentUser != null) {
          retVal = "Success";
        }
      }
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> SignOut() async {
    String retVal = "error";

    try {
      await _auth.signOut();
      _currentUser = OurUser();
      retVal = "Success";
      print("sign out");
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> signUpUser(
      String email, String password, String fullName, String year) async {
    String retVal = "error";
    OurUser _user = OurUser();
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResult.user!.uid;
      _user.email = _authResult.user!.email!;
      _user.fullName = fullName;
      _user.years = year;

      String _returnString = await OurDatabase().createUser(_user);
      if (_returnString == "Success") {
        retVal = "Success";
      }
    } on FirebaseAuthException catch (e) {
      retVal = e.message!;
    }

    return retVal;
  }

  Future<String> loginUser(String email, String password) async {
    String retVal = "error";

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _currentUser = await OurDatabase().getUserInfo(_authResult.user!.uid);
      // ignore: unnecessary_null_comparison
      if (_currentUser != null) {
        retVal = "Success";
      }
    } on FirebaseAuthException catch (e) {
      retVal = e.message!;
    }

    return retVal;
  }
}
