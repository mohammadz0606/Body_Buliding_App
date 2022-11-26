import 'dart:developer';

import 'package:body_building/services/call_data/auth_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant/status.dart';
//bashar  basharqasrawi118@gmail.com    bashar123543
class AppProvider extends ChangeNotifier {
  Status status = Status.Initi;

  // Status get status => _status;
  late UserCredential _auth;
 // Status get status => _status;
  final AuthData _authData = AuthData();
  String _errorMassage = "";

  String get errorMassage => _errorMassage;
  int statusNum = 0;

  void signupApp({
    required String email,
    required String password,
    required String name,
  }) async {
    try{
      status = Status.Wait;
      notifyListeners();
      await _authData.signupApp(email: email, password: password, name: name);
      status = Status.Succeeded;
      notifyListeners();
    }catch(e){
      _errorMassage = e.toString();
      status = Status.Error;
      notifyListeners();
    }
  }
}
