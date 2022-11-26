import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant/status.dart';
//bashar  basharqasrawi118@gmail.com    bashar123543
class AppProvider extends ChangeNotifier {
  Status status = Status.Initi;
 // Status get status => _status;
  late UserCredential _auth;
  String _errorMassage = "";
  String get errorMassage => _errorMassage;

  void signupApp({
    required String email,
    required String password,
    required String name,
  }) async {
    status = Status.Wait;
    notifyListeners();
    try {
      _auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );//
      status = Status.Succeeded;
      notifyListeners();
      log("Done");
////
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _errorMassage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _errorMassage = 'The account already exists for that email.';
      }
      status = Status.Error;
      notifyListeners();
    }
  }
}
