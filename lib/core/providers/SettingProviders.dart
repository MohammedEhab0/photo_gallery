import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingProviders extends ChangeNotifier {

  ThemeMode themeMode = ThemeMode.light;

  SettingProviders() {

  }

  void changeTheme(ThemeMode newThemeMode) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    if (newThemeMode == themeMode) return;

    themeMode = newThemeMode;
    await sharedPreference.setString('themeMode', newThemeMode.toString());
    notifyListeners();
  }
}