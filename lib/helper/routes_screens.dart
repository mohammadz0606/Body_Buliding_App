import 'package:body_building/screens/calculate_screen.dart';
import 'package:body_building/screens/go_to_calculate.dart';
import 'package:body_building/screens/go_to_chose_food_screen.dart';
import 'package:flutter/material.dart';

import '../screens/about_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/bmi_result_screen.dart';
import '../screens/create_schedule/chose_category.dart';
import '../screens/create_schedule/chose_starches_screen.dart';
import '../screens/exercises_video_screen.dart';
import '../screens/nav_screen.dart';
import '../screens/no_internet_screen.dart';
import '../screens/on_boarding_screen.dart';
import '../screens/splash_screen.dart';

class RoutesScreen{
  static Map<String, WidgetBuilder> routesScreens = {
    SplashScreen.route : (context) => const SplashScreen(),
    ChoseStarchesScreen.route:(context)=> ChoseStarchesScreen(),
    ChoseCategory.route:(context)=> ChoseCategory(),
    LoginScreen.route: (context) => LoginScreen(),
    SignupScreen.route: (context) => SignupScreen(),
    NavScreen.route:(context) => const NavScreen(),
    ExerciseVideoScreen.route:(context) => const ExerciseVideoScreen(),
    NoInterNetScreen.route:(context) => const NoInterNetScreen(),
    BMIResultScreen.route :(context) => const BMIResultScreen(),
    AboutScreen.route :(context) => const AboutScreen(),
    OnBoardingScreen.route : (context) => OnBoardingScreen(),
    GoToCalculatePage.rout:(context)=>GoToCalculatePage(),
    CalculateScreen.route:(context)=>CalculateScreen(),
    GoToChooseMealPage.rout:(context)=>GoToChooseMealPage()
  };
}