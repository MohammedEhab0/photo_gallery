import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../providers/SettingProviders.dart';
import '../theme/AppColors.dart';
import '../theme/AppStyle.dart';

class ToggleTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingProviders = Provider.of<SettingProviders>(context);
    bool isDark = settingProviders.themeMode == ThemeMode.dark;

    return AnimatedToggleSwitch<bool>.dual(
      current: isDark,
      first: false,
      second: true,
      height: 40,
      style: ToggleStyle(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        borderColor: AppColors.gray,
        borderRadius: BorderRadius.circular(20),
        indicatorColor: Theme.of(context).primaryColor,
      ),
      onChanged: (val) {
        settingProviders.changeTheme(val ? ThemeMode.dark : ThemeMode.light);
      },
      iconBuilder: (val) => Icon(
        val ? Icons.nightlight : Icons.sunny,
        color: Theme.of(context).secondaryHeaderColor,
        size: 20,
      ),
      textBuilder: (val) => Text(
        val ? 'dark' : 'light',
        style: AppStyle.bold16White.copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
