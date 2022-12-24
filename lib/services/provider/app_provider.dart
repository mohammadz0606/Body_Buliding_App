import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../constant/constant_style.dart';
import '../../constant/shared_preferences.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/exercises_screen.dart';
import '../../screens/more_screen_app.dart';
import '../models/category_model.dart';
import '../models/excercises_model.dart';
import '../models/on_boarding_model.dart';
import '../models/trainers_model.dart';
import '/screens/calculate_screen.dart';
import '/screens/home_screen.dart';

import '/screens/nav_screen.dart';

import '../models/user_model.dart';
import '/constant/constant_widget.dart';

import '/services/call_data/database.dart';

import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int? typeCat;
  final List<Map<String, dynamic>> starchesItems = [
    {
      'name': 'Arabic white bread',
      'quantity': 100,
      'calories': 240,
      'value': false,
      'imageUrl':
          'https://storage.googleapis.com/tm-zopsmart-uploads/320/20201101/275654_1-20201101-005423.png',
    },
    {
      'name': 'Samun bread',
      'quantity': 100,
      'calories': 200,
      'value': false,
      'imageUrl':
          'https://www.196flavors.com/wp-content/uploads/2019/10/samoon-1.jpg'
    },
    {
      'name': 'Hmam bread',
      'quantity': 100,
      'calories': 190,
      'value': false,
      'imageUrl':
          'https://d1w12by6syh8ys.cloudfront.net/media/catalog/product/cache/7fedf0e3853b01c200bc50c01bc9a2d2/m/a/marhaba_1235.jpg',
    },

    {
      'name': 'Oats',
      'quantity': 100,
      'calories': 240,
      'value': false,
      'imageUrl':
          'https://post.healthline.com/wp-content/uploads/2020/03/oats-oatmeal-732x549-thumbnail.jpg',
    },
    {
      'name': 'Macaroni',
      'quantity': 100,
      'calories': 140,
      'value': false,
      'imageUrl':
          'https://insanelygoodrecipes.com/wp-content/uploads/2022/05/Old-Fashioned-Macaroni-and-Cheese-in-a-Casserole.jpg',
    },
    {
      'name': 'Potato',
      'quantity': 100,
      'calories': 160,
      'value': false,
      'imageUrl':
          'https://www.almrsal.com/wp-content/uploads/2019/02/%D8%A7%D9%84%D8%A8%D8%B7%D8%A7%D8%B7%D8%B3-%D8%A7%D9%84%D9%85%D8%B3%D9%84%D9%88%D9%82%D8%A9.jpg',
    }
  ];
  final List<Map<String, dynamic>> fatsItems = [
    {
      'name': 'olive oil',
      'quantity': 10,
      'calories': 90,
      'value': false,
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEPp_KRTCQMwQn5p5HqB1nnSU6pXmUyMiSYg&usqp=CAU',
    },
    {
      'name': 'butter',
      'quantity': 10,
      'calories': 72,
      'value': false,
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0jn1LpY4-TzWYKn7DTORYy18JuOzGeuxBNg&usqp=CAU',
    },
    {
      'name': 'Lamb fat',
      'quantity': 10,
      'calories': 54,
      'value': false,
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgCVyfXNhXev0QfPORkOptPthYqd29EDBEYw&usqp=CAU',
    },
    {
      'name': 'Nuts',
      'quantity': 10,
      'calories': 54,
      'value': false,
      'imageUrl':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqtEOXeSOIKz68QGb80iR2ZfacwGfY2WS5Jg&usqp=CAU',
    },
    {
      'name': 'avocado',
      'quantity': 10,
      'calories': 45,
      'value': false,
      'imageUrl':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnJRjzfngT-B2JLVCtEDHYKg_J7E70N49qwg&usqp=CAU',
    },
    {
      'name': 'Peanut Butter',
      'quantity': 10,
      'calories': 54,
      'value': false,
      'imageUrl':
      'data:image/jpeg;base64,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',
    },

  ];

  final List<Map<String, dynamic>> proteinsItems = [
    {
      'name': 'Chicken Breast',
      'quantity': 100,
      'calories': 125,
      'value': false,
      'imageUrl':
          'https://www.wattan.net/data/image/794x466/06121401301764940612537543315301.jpg',
    },
    {
      'name': 'Chicken Thigh',
      'quantity': 100,
      'calories': 100,
      'value': false,
      'imageUrl':
          'https://sc01.alicdn.com/kf/UTB8qUgKQtoSdeJk43Owxh5a4XXaj/Frozen-Turkey-Leg-Meat-Thigh-meat-for.jpeg',
    },
    {
      'name': 'Chicken leg',
      'quantity': 100,
      'calories': 114,
      'value': false,
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgE_hX5frt6PN7U6kxINyw1jS7_E3josFs4w&usqp=CAU',
    },
    {
      'name': 'Chicken Wing',
      'quantity': 100,
      'calories': 48,
      'value': false,
      'imageUrl':
          'https://thewoksoflife.com/wp-content/uploads/2016/11/spicy-fried-chicken-8-1.jpg',
    },
    {
      'name': 'Veal',
      'quantity': 100,
      'calories': 220,
      'value': false,
      'imageUrl':
          'https://hankstruebbq.com/wp-content/uploads/2018/12/Kalvracks-1000x666.jpg',
    },
    {
      'name': 'Lamb',
      'quantity': 100,
      'calories': 140,
      'value': false,
      'imageUrl':
          'https://www.sainsburysmagazine.co.uk/uploads/media/1800x1800/00/10490-Roast-lamb.jpg?v=1-0',
    },
    {
      'name': 'Fish',
      'quantity': 100,
      'calories': 120,
      'value': false,
      'imageUrl':
          'https://www.thelist.com/img/gallery/what-happens-to-your-body-when-you-stop-eating-fish/l-intro-1615430058.jpg',
    },
    {
      'name': 'Shrimp',
      'quantity': 100,
      'calories': 160,
      'value': false,
      'imageUrl':
          'https://www.sweetandsavorybyshinee.com/wp-content/uploads/2021/05/Shrimp-2-1.jpg',
    }
  ];

  void choseStarchesItem(bool value, int index) {
    if (typeCat == 0) {
      starchesItems[index]['value'] = value;
      if (value) {
        calories = calories! - (starchesItems[index]['calories'] as int);
      } else {
        calories = calories! + (starchesItems[index]['calories'] as int);
      }
    } else if (typeCat == 1) {
      fatsItems[index]['value'] = value;
      if (value) {
        calories = calories! - (fatsItems[index]['calories'] as int);
      } else {
        calories = calories! + (fatsItems[index]['calories'] as int);
      }
    } else {
      proteinsItems[index]['value'] = value;
      if (value) {
        calories = calories! - (proteinsItems[index]['calories'] as int);
      } else {
        calories = calories! + (proteinsItems[index]['calories'] as int);
      }
    }
    notifyListeners();
  }

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

  final ImagePicker _picker = ImagePicker();
  File? profileImage;
  bool _loadingImage = false;
  bool _isLast = false;
  bool get isLast => _isLast;

  void shareApp() async {
    await Share.share("com.example.body_building");
    notifyListeners();
  }

  void onPageViewChanged({
    required int? indexChang,
    required List<OnBoardingModel> items,
  }) {
    if (indexChang == items.length - 1) {
      _isLast = true;
      notifyListeners();
    } else {
      _isLast = false;
      notifyListeners();
    }
  }

  void endPageView(BuildContext context){
    SaveData.setData(key: "goToLogin", value: true).then(
          (value) {
        notifyListeners();
        return Navigator.of(context).pushReplacementNamed(
          FirebaseAuth.instance.currentUser == null
              ? LoginScreen.route
              : NavScreen.route,
        );
      },
    );
  }

  void getProfileImage({
    required BuildContext context,
    required ImageSource source,
  }) async {
    final XFile? image = await _picker.pickImage(
      source: source,
    );
    if (image != null) {
      _loadingImage = true;
      profileImage = File(image.path);
      ConstantWidget.massage(
        context: context,
        text: "Wait for the image to load",
      );
      notifyListeners();
      profileImage = await _cropImage(path: profileImage!);
      String url = await _database.uploadImageProfileInFireStorage(
        profileImage: profileImage!,
        userImage: _userModel!.userImage,
      );
      await _database.updateData(userModel: _userModel!, newImage: url);
      getDataForeFireStore();
      _loadingImage = false;
      notifyListeners();
      ConstantWidget.massage(
        context: context,
        text: "Done Update 👌",
      );
      notifyListeners();
    } else {
      ConstantWidget.massage(
        context: context,
        text: "You did not select an image 😒",
      );
      notifyListeners();
      return;
    }
  }

  Future<File?> _cropImage({
    required File path,
  }) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: MyColors.primaryColor,
          toolbarWidgetColor: Colors.white,
          statusBarColor: MyColors.primaryColor,
          backgroundColor: MyColors.primaryColor,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    if (croppedFile == null) {
      notifyListeners();
      return File(path.path);
    } else {
      notifyListeners();
      return File(croppedFile.path);
    }
  }

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
    _selectedIndex = 0;
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

  getBestWeight() {
    if (isMale == 1) {
      bestWeight = height - 100;
    } else {
      bestWeight = height - 105;
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

  void choseCategory(int type) {
    typeCat = type;

    notifyListeners();
  }
}
