
import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'AppStyle.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(color:AppColors.primaryDark ),
      secondaryHeaderColor: AppColors.primarylight,
      primaryColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.primaryDark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          selectedItemColor: AppColors.white,
          selectedLabelStyle: AppStyle.bold12White,
          unselectedLabelStyle: AppStyle.bold12White));
  static final ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(color:AppColors.primarylight ),
      secondaryHeaderColor: AppColors.primaryDark,
      primaryColor: AppColors.primarylight,
      scaffoldBackgroundColor: AppColors.backgroundlight,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          selectedItemColor: AppColors.white,
          selectedLabelStyle: AppStyle.bold12White,
          unselectedLabelStyle: AppStyle.bold12White));
}
