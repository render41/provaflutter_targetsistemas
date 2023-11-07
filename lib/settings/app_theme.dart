import 'package:flutter/material.dart';
import 'package:provaflutter_targetsistemas/common/style/app_style.dart';

class AppTheme {
  ThemeData themeAppDefault(BuildContext context) {
    return ThemeData(
      primaryColor: AppStyle.greenBaseColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppStyle.greenBaseColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ),
      textTheme: Theme.of(context).textTheme.apply(bodyColor: AppStyle.primaryColor),
    );
  }
}
