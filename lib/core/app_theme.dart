import 'package:flutter/material.dart';
import 'package:task_201/core/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColorA,
    primaryColorDark: AppColors.primaryColorA,
    primaryColorLight: AppColors.primaryColorB,

    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: MaterialColor(primary, swatch)
    // )
    // cardTheme: CardTheme(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        side: BorderSide(color: AppColors.primaryColorA),
        textStyle: TextStyle(color: Colors.black, fontSize: 15),
      ),
    ),
  );
}
