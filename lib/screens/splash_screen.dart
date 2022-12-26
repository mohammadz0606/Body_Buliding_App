import 'dart:async';

import 'package:body_building/screens/on_boarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/shared_preferences.dart';
import 'auth/login_screen.dart';
import 'nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String route = "splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed(
        SaveData.getData(key: "goToLogin") == null || false
            ? OnBoardingScreen.route
            : FirebaseAuth.instance.currentUser == null
                ? LoginScreen.route
                : NavScreen.route,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
