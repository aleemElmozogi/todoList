import 'package:flutter/material.dart';
import 'package:inject/utils/app_colors.dart';
import 'package:inject/utils/app_string.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    fontFamily: AppString.fontFamily,
    scaffoldBackgroundColor: Colors.white,
  );
}
// ThemeData(
//           primarySwatch: Colors.blue,
//         )
