import 'package:body_building/constant/constant_widget.dart';

import '/services/call_data/auth_data.dart';

import 'package:flutter/material.dart';

import '../../constant/status.dart';

class AppProvider extends ChangeNotifier {

  final AuthData _authData = AuthData();
  bool isLoading = false;

  void signupApp({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      await _authData.signupApp(email: email, password: password, name: name);
      isLoading = false;
      ConstantWidget.massage(context: context, text: "Register is Done");
      Navigator.of(context).pop();
      notifyListeners();
    } catch (e) {

      isLoading = false;
      ConstantWidget.massage(context: context, text: e.toString());
      notifyListeners();
    }
  }
}
