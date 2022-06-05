import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
        //2
        appBarTheme: const AppBarTheme(
          color: CustomColors.primaryColor,
          iconTheme: IconThemeData(
            color: CustomColors.white,
          ),
        ),
        //drawerTheme: const DrawerThemeData(backgroundColor: Colors.amber),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: CustomColors.primaryColor),
        primaryColor: CustomColors.primaryColor,
        scaffoldBackgroundColor: CustomColors.white,
        fontFamily: 'Montserrat', //3
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          color: CustomColors.dark,
          iconTheme: IconThemeData(
            color: CustomColors.white,
          ),
        ),
        primaryColor: CustomColors.primaryColor,
        scaffoldBackgroundColor: CustomColors.black,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        ));
  }
}
