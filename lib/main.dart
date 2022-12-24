import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/screens/about_screen.dart';
import 'package:body_building/screens/bmi_result_screen.dart';
import 'package:body_building/screens/create_schedule/chose_category.dart';
import 'package:body_building/screens/create_schedule/chose_starches_screen.dart';
import 'package:body_building/screens/nav_screen.dart';
import 'package:body_building/screens/no_internet_screen.dart';
import 'package:body_building/screens/on_boarding_screen.dart';
import 'package:body_building/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'constant/shared_preferences.dart';
import 'firebase_options.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/exercises_video_screen.dart';
import 'services/provider/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveData.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const BodyBulidingApp());
}

class BodyBulidingApp extends StatelessWidget {
  const BodyBulidingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: MyColors.primaryColor,
          primaryColor: MyColors.firstColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: MyColors.primaryColor,
            elevation: 20,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
        ),
        initialRoute: SplashScreen.route,
        //initialRoute: OnBoardingScreen.route,
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? LoginScreen.route
            : NavScreen.route,
        routes: {
          SplashScreen.route : (context) => const SplashScreen(),
          ChoseStarchesScreen.route:(context)=>ChoseStarchesScreen(),

          ChoseCategory.route:(context)=>ChoseCategory(),
          LoginScreen.route: (context) => LoginScreen(),
          SignupScreen.route: (context) => SignupScreen(),
          NavScreen.route:(context) => const NavScreen(),
          ExerciseVideoScreen.route:(context) => const ExerciseVideoScreen(),
          NoInterNetScreen.route:(context) => const NoInterNetScreen(),
          BMIResultScreen.route :(context) => const BMIResultScreen(),
          AboutScreen.route :(context) => const AboutScreen(),
          OnBoardingScreen.route : (context) => OnBoardingScreen(),
          NavScreen.route: (context) => const NavScreen(),
          ExerciseVideoScreen.route: (context) => const ExerciseVideoScreen(),
          NoInterNetScreen.route: (context) => const NoInterNetScreen(),
          BMIResultScreen.route: (context) => const BMIResultScreen(),
          AboutScreen.route: (context) => const AboutScreen(),
        },
      ),
    );
  }
}