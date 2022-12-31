import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../helper/constant_style.dart';
import '../../helper/constant_widget.dart';
import '../../helper/shared_preferences.dart';
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

import '/services/call_data/database.dart';

import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int? typeCat;
  final List<Map<String, dynamic>> starchesItems = [
    {
      'name': 'Arabic white bread',
      'groupValue': 1,
      'quantity': 100,
      'calories': 240,
      'value': 0,
      'imageUrl':
          'https://storage.googleapis.com/tm-zopsmart-uploads/320/20201101/275654_1-20201101-005423.png',
      'visible': false
    },
    {
      'name': 'Samun bread',
      'quantity': 100,
      'calories': 200,
      'value': 0,
      'groupValue': 1,
      'imageUrl':
          'https://www.196flavors.com/wp-content/uploads/2019/10/samoon-1.jpg',
      'visible': false
    },
    {
      'name': 'Hmam bread',
      'quantity': 100,
      'calories': 190,
      'value': 0,
      'groupValue': 1,
      'imageUrl':
          'https://d1w12by6syh8ys.cloudfront.net/media/catalog/product/cache/7fedf0e3853b01c200bc50c01bc9a2d2/m/a/marhaba_1235.jpg',
      'visible': false
    },
    {
      'name': 'Oats',
      'groupValue': 1,
      'quantity': 100,
      'calories': 240,
      'value': 0,
      'visible': false,
      'imageUrl':
          'https://post.healthline.com/wp-content/uploads/2020/03/oats-oatmeal-732x549-thumbnail.jpg',
    },
    {
      'name': 'Macaroni',
      'quantity': 100,
      'visible': false,
      'calories': 140,
      'groupValue': 1,
      'value': 0,
      'imageUrl':
          'https://insanelygoodrecipes.com/wp-content/uploads/2022/05/Old-Fashioned-Macaroni-and-Cheese-in-a-Casserole.jpg',
    },
    {
      'name': 'Potato',
      'groupValue': 1,
      'quantity': 100,
      'calories': 160,
      'visible': false,
      'value': 0,
      'imageUrl':
          'https://www.almrsal.com/wp-content/uploads/2019/02/%D8%A7%D9%84%D8%A8%D8%B7%D8%A7%D8%B7%D8%B3-%D8%A7%D9%84%D9%85%D8%B3%D9%84%D9%88%D9%82%D8%A9.jpg',
    }
  ];
  final List<Map<String, dynamic>> fatsItems = [
    {
      'name': 'olive oil',
      'quantity': 10,
      'visible': false,
      'groupValue': 1,
      'calories': 90,
      'value': 0,
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEPp_KRTCQMwQn5p5HqB1nnSU6pXmUyMiSYg&usqp=CAU',
    },
    {
      'name': 'butter',
      'quantity': 10,
      'calories': 72,
      'visible': false,
      'groupValue': 1,
      'value': 0,
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0jn1LpY4-TzWYKn7DTORYy18JuOzGeuxBNg&usqp=CAU',
    },
    {
      'name': 'Lamb fat',
      'quantity': 10,
      'calories': 54,
      'groupValue': 1,
      'value': 0,
      'visible': false,
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgCVyfXNhXev0QfPORkOptPthYqd29EDBEYw&usqp=CAU',
    },
    {
      'name': 'Nuts',
      'quantity': 10,
      'groupValue': 1,
      'calories': 54,
      'visible': false,
      'value': 0,
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqtEOXeSOIKz68QGb80iR2ZfacwGfY2WS5Jg&usqp=CAU',
    },
    {
      'name': 'avocado',
      'quantity': 10,
      'calories': 45,
      'groupValue': 1,
      'value': 0,
      'visible': false,
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnJRjzfngT-B2JLVCtEDHYKg_J7E70N49qwg&usqp=CAU',
    },
    {
      'name': 'Peanut Butter',
      'quantity': 10,
      'calories': 54,
      'value': 0,
      'groupValue': 1,
      'visible': false,
      'imageUrl':
          'https://assets.bonappetit.com/photos/63409999c6b2a3464a5c9bf3/16:9/w_2560%2Cc_limit/1007-pb-taste-test-lede.jpg',
    },
  ];
  final List<Map<String, dynamic>> proteinsItems = [
    {
      'name': 'Chicken Breast',
      'quantity': 20,
      'calories': 125,
      'visible': false,
      'value': 0,
      'groupValue': 1,
      'imageUrl':
          'https://www.wattan.net/data/image/794x466/06121401301764940612537543315301.jpg',
    },
    {
      'name': 'Chicken Thigh',
      'quantity': 100,
      'visible': false,
      'calories': 100,
      'groupValue': 1,
      'value': 0,
      'imageUrl':
          'https://sc01.alicdn.com/kf/UTB8qUgKQtoSdeJk43Owxh5a4XXaj/Frozen-Turkey-Leg-Meat-Thigh-meat-for.jpeg',
    },
    {
      'name': 'Chicken leg',
      'quantity': 100,
      'calories': 114,
      'groupValue': 1,
      'visible': false,
      'value': 0,
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgE_hX5frt6PN7U6kxINyw1jS7_E3josFs4w&usqp=CAU',
    },
    {
      'name': 'Chicken Wing',
      'quantity': 100,
      'groupValue': 1,
      'calories': 48,
      'visible': false,
      'value': 0,
      'imageUrl':
          'https://thewoksoflife.com/wp-content/uploads/2016/11/spicy-fried-chicken-8-1.jpg',
    },
    {
      'name': 'Veal',
      'quantity': 100,
      'calories': 220,
      'value': 0,
      'groupValue': 1,
      'visible': false,
      'imageUrl':
          'https://hankstruebbq.com/wp-content/uploads/2018/12/Kalvracks-1000x666.jpg',
    },
    {
      'name': 'Lamb',
      'quantity': 100,
      'visible': false,
      'groupValue': 1,
      'calories': 140,
      'value': 0,
      'imageUrl':
          'https://www.sainsburysmagazine.co.uk/uploads/media/1800x1800/00/10490-Roast-lamb.jpg?v=1-0',
    },
    {
      'name': 'Fish',
      'quantity': 100,
      'groupValue': 1,
      'calories': 120,
      'visible': false,
      'value': 0,
      'imageUrl':
          'https://www.thelist.com/img/gallery/what-happens-to-your-body-when-you-stop-eating-fish/l-intro-1615430058.jpg',
    },
    {
      'name': 'Shrimp',
      'groupValue': 1,
      'visible': false,
      'quantity': 100,
      'calories': 160,
      'value': 0,
      'imageUrl':
          'https://www.sweetandsavorybyshinee.com/wp-content/uploads/2021/05/Shrimp-2-1.jpg',
    }
  ];

  //name      =>  'name'
  //calories  =>  'calories'
  //image     =>  'imageUrl'
  //quantity  =>  'quantity'
  List<Map<String, dynamic>> finalProteinsItems = [];
  List<Map<String, dynamic>> finalFatsItems = [];
  List<Map<String, dynamic>> finalStarchesItems = [];

  changeFinalList({required int cal,
      required int quantity,
      required String name,
      required String imageUrl, required int type}) {
    if (type == 1) {
      if (!finalStarchesItems.isEmpty) {
        finalStarchesItems.removeWhere((element) => name == element['name']);
      }

      finalStarchesItems.add({
        'name': name,
        'calories': cal,
        'quantity': quantity,
        'imageUrl': imageUrl
      });
    } else if (type == 2) {
      if (!finalFatsItems.isEmpty) {
        finalFatsItems.removeWhere((element) => name == element['name']);
      }

      finalFatsItems.add({
        'name': name,
        'calories': cal,
        'quantity': quantity,
        'imageUrl': imageUrl
      });
    } else {
      if (!finalProteinsItems.isEmpty) {
        finalProteinsItems.removeWhere((element) => name == element['name']);
      }
      finalProteinsItems.add({
        'name': name,
        'calories': cal,
        'quantity': quantity,
        'imageUrl': imageUrl
      });
    }

    notifyListeners();
  }

  int portion = 1;

  void changeCount(int val, int type, int index) {
    if (type == 1) {
      starchesItems[index]['groupValue'] = val;
      starchesItems[index]['value'] = val;

      changeFinalList(
          cal: starchesItems[index]['calories'] * val,
          quantity: starchesItems[index]['quantity'] * val,
          name: starchesItems[index]['name'],
          imageUrl: starchesItems[index]['imageUrl'],
          type: type);
    } else if (type == 2) {
      fatsItems[index]['groupValue'] = val;
      fatsItems[index]['value'] = val;
      changeFinalList(
          cal: fatsItems[index]['calories'] * val,
          quantity: fatsItems[index]['quantity'] * val,
          name: fatsItems[index]['name'],
          imageUrl: fatsItems[index]['imageUrl'],
          type: type);
    } else {
      proteinsItems[index]['groupValue'] = val;
      proteinsItems[index]['value'] = val;
      changeFinalList(
          cal: proteinsItems[index]['calories'] * val,
          quantity: proteinsItems[index]['quantity'] * val,
          name: proteinsItems[index]['name'],
          imageUrl: proteinsItems[index]['imageUrl'],
          type: type);
    }
changeCalories();
    notifyListeners();
  }

  void choseStarchesItem(bool value, int index, BuildContext context) {
    if (typeCat == 0) {
      starchesItems[index]['visible'] = value;

      starchesItems[index]['value'] = value ? 1 : 0;
      if (value) {
        changeFinalList(
            cal: starchesItems[index]['calories'],
            quantity: starchesItems[index]['quantity'] *
                starchesItems[index]['value'],
            name: starchesItems[index]['name'],
            imageUrl: starchesItems[index]['imageUrl'],
            type: 1);

      } else {
        finalStarchesItems.removeWhere(
            (element) => starchesItems[index]['name'] == element['name']);

      }
    } else if (typeCat == 1) {
      fatsItems[index]['visible'] = value;

      fatsItems[index]['value'] = value ? 1 : 0;

      if (value) {
        changeFinalList(
            cal: fatsItems[index]['calories'],
            quantity: fatsItems[index]['quantity'] * fatsItems[index]['value'],
            name: fatsItems[index]['name'],
            imageUrl: fatsItems[index]['imageUrl'],
            type: 2);

      } else {
        finalFatsItems.removeWhere(
            (element) => fatsItems[index]['name'] == element['name']);

      }
    } else {
      proteinsItems[index]['visible'] = value;
      proteinsItems[index]['value'] = value ? 1 : 0;

      if (value) {
        changeFinalList(
            cal: proteinsItems[index]['calories'],
            quantity: proteinsItems[index]['quantity'] *
                proteinsItems[index]['value'],
            name: proteinsItems[index]['name'],
            imageUrl: proteinsItems[index]['imageUrl'],
            type: 3);

      } else {
        finalProteinsItems.removeWhere(
            (element) => proteinsItems[index]['name'] == element['name']);

      }
    }

changeCalories();
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
  int? calories1;
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

//
  void endPageView(BuildContext context) {
    /*
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
    });
     */
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

  void getResult(BuildContext context) async {
    getBestWeight();

    if (isMuscular == 1) {
      calories = ((weight * 2.2 * 10) * activity + 500).toInt();
    } else {
      calories = ((weight * 2.2 * 10) * activity - 500).toInt();
    }

    calories1 = calories;
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

  void changeCalories() {
    calories1 = calories;
    finalFatsItems.forEach((element) {
      calories1 = (calories1! - element['calories']) as int?;
    });
    finalStarchesItems.forEach((element) {
      calories1 = (calories1! - element['calories']) as int?;
    });
    finalProteinsItems.forEach((element) {
      calories1 = (calories1! - element['calories']) as int?;
    });
    notifyListeners();
  }
}
