import 'package:body_building/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'helper/app_theme.dart';
import 'helper/routes_screens.dart';
import 'helper/shared_preferences.dart';
import 'services/provider/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveData.init();
  //SaveData.sharedPreferences.clear();
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
  runApp(
    const BodyBulidingApp(),
  );
}

class BodyBulidingApp extends StatelessWidget {
  const BodyBulidingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
       /* useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,*/
        debugShowCheckedModeBanner: false,
        theme: AppThemes.appTheme,
        initialRoute: SplashScreen.route,
        routes: RoutesScreen.routesScreens,
      ),
    );
  }
}
