import 'dart:developer';

import '/screens/home_screen.dart';

import '../models/user_model.dart';
import '/constant/constant_widget.dart';

import '/services/call_data/auth_data.dart';

import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  final AuthData _authData = AuthData();
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void signupApp({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authData.signupApp(
        email: email,
        password: password,
        name: name,
      );
      await _authData.setDataForeFireStore(
        email: email,
        password: password,
        name: name,
      );
      _isLoading = false;
      ConstantWidget.massage(context: context, text: "Register is Done");
      Navigator.of(context).pop();
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      ConstantWidget.massage(context: context, text: e.toString());
      notifyListeners();
    }
  }

  void signInApp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authData.signInApp(
        email: email,
        password: password,
      );
      _isLoading = false;
      ConstantWidget.massage(context: context, text: "Welcome App 🏋🏽");
      Navigator.of(context).pushReplacementNamed(HomeScreen.route);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      ConstantWidget.massage(context: context, text: e.toString());
      notifyListeners();
    }
  }

  void signOut() async {
    await _authData.signOut();
    _userModel = null;
    notifyListeners();
  }

  void getDataForeFireStore() async {
    try {
      _isLoading = true;
      notifyListeners();
      _userModel = UserModel.fromMap(await _authData.getDataForeFireStore());
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      log(e.toString());
      notifyListeners();
    }
  }
}
