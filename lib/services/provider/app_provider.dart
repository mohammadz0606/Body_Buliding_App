import 'package:body_building/screens/more_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../screens/exercises_screen.dart';
import '../models/category_model.dart';
import '../models/excercises_model.dart';
import '../models/trainers_model.dart';
import '/screens/calculate_screen.dart';
import '/screens/home_screen.dart';

import '/screens/nav_screen.dart';

import '../models/user_model.dart';
import '/constant/constant_widget.dart';

import '/services/call_data/database.dart';

import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String appBarTitle = "";

  double sliderVal = 0;
  int age = 0;

  // 0 = noSelected
  // 1 = male
  // 2 = female
  int isMale = 0;
  double bestWeight = 0;

  // 0 = noSelected
  // 1 = male
  // 2 = female
  int isMuscular = 0;
  Color muscularColor = Colors.grey;
  Color dryingOfFatColor = Colors.grey;

  Color maleColor = const Color.fromRGBO(105, 104, 104, 1);
  Color femaleColor = const Color.fromRGBO(105, 104, 104, 1);

  double height = 175;
  double weight = 70;
  double activity = 0;
  int? calories;
  int numberSelected = 5;
  List<Map<String, dynamic>> numberOfDay = [
    {'value': 1.2, 'submit': false},
    {'value': 1.3, 'submit': false},
    {'value': 1.5, 'submit': false},
    {'value': 1.7, 'submit': false},
    {'value': 1.9, 'submit': false}
  ];

  void setNumberOfDay(int value) {
    for (var element in numberOfDay) {
      element['submit'] = false;
    }
    numberOfDay[value]['submit'] = true;
    activity = numberOfDay[value]['value'];
    notifyListeners();
  }

  void setType(bool isMuscular) {
    if (isMuscular) {
      this.isMuscular = 1;
      dryingOfFatColor = const Color.fromRGBO(105, 104, 104, 1);
      muscularColor = Colors.white;
    } else {
      this.isMuscular = 2;
      muscularColor = const Color.fromRGBO(105, 104, 104, 1);
      dryingOfFatColor = Colors.white;
    }
    notifyListeners();
  }

  void setGender(bool isMale) {
    if (isMale) {
      this.isMale = 1;
      maleColor = Colors.blue;
      femaleColor = Colors.grey;
    } else {
      this.isMale = 2;

      maleColor = Colors.grey;
      femaleColor = Colors.pink;
    }
    notifyListeners();
  }

  void setHeight(double height) {
    this.height = height;
    notifyListeners();
  }

  void setWeight(double weight) {
    this.weight += weight;
    notifyListeners();
  }

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

  List<CategoryModel> _category = [];

  List<CategoryModel> get category => _category;

  List<ExcercisesModel> _excercises = [];

  List<ExcercisesModel> get excercises => _excercises;

  List<ExcercisesModel> _excercisesFillters = [];

  List<ExcercisesModel> get excercisesFillters => _excercisesFillters;

  final List<Widget> _screens = [
    HomeScreen(),
    const CalculateScreen(),
    const ExercisesScreen(),
    MoreAppScreen(),
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
      ConstantWidget.massage(context: context, text: "Register is Done 😊");
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

  void getAllExcercises() async {
    try {
      _excercises = await _database.getAllExcercises();
    } catch (e) {
      notifyListeners();
    }
  }

  void excercisesFillter({required String id, required String appBarTitle}) {
    _excercisesFillters = [];
    this.appBarTitle = "";
    notifyListeners();
    this.appBarTitle = appBarTitle;
    _excercisesFillters =
        _excercises.where((element) => element.id == id).toList();
    notifyListeners();
  }

  void getCategory() async {
    try {
      _category = await _database.getCategory();
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
    } else {
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
  }) async {
    if (await canLaunchUrl(Uri.parse(tiktok))) {
      if (tiktok == "no") {
        ConstantWidget.massage(
          context: context,
          text: "Unavailable at the moment 😢",
        );
        notifyListeners();
      } else {
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

  Future<void> excercisesVideo({
    required String video,
    required BuildContext context,
  }) async {
    /*ConstantWidget.massage(
      context: context,
      text: "Waiting 😄",
    );*/
    if (await canLaunchUrl(Uri.parse(video))) {
      await launchUrl(
        Uri.parse(video),
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

  void getResult() async {
    getBestWeight();

    if (isMuscular == 1) {
      calories = ((weight * 2.2 * 10) * activity + 500).toInt();
    } else {
      calories = ((weight * 2.2 * 10) * activity - 500).toInt();
    }
    notifyListeners();
  }

  void getBestWeight() {
    if (isMale == 1) {
      bestWeight = height - 100;
    } else {
      bestWeight = height - 105;
    }
    notifyListeners();
  }
}
