import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

import '../../screens/exercises_screen.dart';
import '../models/trainers_model.dart';
import '/screens/calculate_screen.dart';
import '/screens/home_screen.dart';

import '/screens/nav_screen.dart';

import '../models/user_model.dart';
import '/constant/constant_widget.dart';

import '/services/call_data/database.dart';

import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  final Database _database = Database();
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  List<TrainersModel> _trainers = [];

  List<TrainersModel> get trainers => _trainers;

  final List<Widget> _screens = [
    HomeScreen(),
    const CalculateScreen(),
    const ExercisesScreen(),
  ];

  List<Widget> get screens => _screens;

  void signupApp({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _database.signupApp(
        email: email,
        password: password,
        name: name,
      );
      await _database.setDataForeFireStore(
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
      await _database.signInApp(
        email: email,
        password: password,
      );
      _isLoading = false;
      notifyListeners();
      ConstantWidget.massage(context: context, text: "Welcome App 🏋🏽");
      Navigator.of(context).pushReplacementNamed(NavScreen.route);
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      ConstantWidget.massage(context: context, text: e.toString());
      notifyListeners();
    }
  }

  void signOut() async {
    await _database.signOut();
    _userModel = null;
    notifyListeners();
  }

  void getDataForeFireStore() async {
    try {
      _userModel = UserModel.fromMap(await _database.getDataForeFireStore());
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  void onTabChange(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void onPageChanged({
    required int index,
  }) {
    _currentIndex = index;
    notifyListeners();
  }

  void getTrainers() async {
    try {
      _trainers = await _database.getTrainers();
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  Future<void> openWhatsAppChat({
    required String phone,
    required BuildContext context,
  }) async {
    if (await canLaunchUrl(Uri.parse("whatsapp://send?phone=$phone"))) {
      if (phone == "no") {
        ConstantWidget.massage(
          context: context,
          text: "Unavailable at the moment 😢",
        );
        notifyListeners();
      } else {
        await launchUrl(
          Uri.parse("whatsapp://send?phone=$phone"),
        );
        notifyListeners();
      }
    }else {
      ConstantWidget.massage(
        context: context,
        text: "Unavailable at the moment 😢",
      );
      notifyListeners();
    }
  }

  Future<void> openInstagram({
    required String instagram,
    required BuildContext context,
  }) async {
    if (await canLaunchUrl(Uri.parse(instagram))) {
      await launchUrl(
        Uri.parse(instagram),
      );
      notifyListeners();
    } else {
      ConstantWidget.massage(
        context: context,
        text: "Unavailable at the moment 😢",
      );
      notifyListeners();
    }
  }

  Future<void> openTiktok({
    required String tiktok,
    required BuildContext context,
  }) async{
    if (await canLaunchUrl(Uri.parse(tiktok))) {
      if(tiktok == "no"){
        ConstantWidget.massage(
          context: context,
          text: "Unavailable at the moment 😢",
        );
        notifyListeners();
      }else{
        await launchUrl(
          Uri.parse(tiktok),
        );
        notifyListeners();
      }

    } else {
      ConstantWidget.massage(
        context: context,
        text: "Unavailable at the moment 😢",
      );
      notifyListeners();
    }
  }
}
