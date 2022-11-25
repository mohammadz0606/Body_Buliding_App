import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant/status.dart';

class AppProvider extends ChangeNotifier {
  Status _status = Status.Initi;
  Status get status => _status;
  late UserCredential _auth;
  String _errorMassage = "";
  String get errorMassage => _errorMassage;

  void signupApp({
    required String email,
    required String password,
    required String name,
  }) async {
    _status = Status.Wait;
    notifyListeners();
    try {
      _auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _status = Status.Succeeded;
      print("Done");
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _errorMassage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _errorMassage = 'The account already exists for that email.';
      }
      _status = Status.Error;
      notifyListeners();
    }
  }
}
