import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant_style.dart';

class AppThemes {

  static ThemeData appTheme = ThemeData(
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
  );

}
