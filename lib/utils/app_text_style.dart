import 'package:flutter/material.dart';
import 'package:inject/utils/app_colors.dart';
import 'package:inject/utils/app_string.dart';

class AppTextStyle {
  static const TextStyle mainText = TextStyle(
      fontFamily: AppString.fontFamily,
      color: AppColors.mainColor,
      fontSize: 17,
      fontWeight: FontWeight.bold);
  static TextStyle mainTextP = TextStyle(
      fontFamily: AppString.fontFamily,
      color: AppColors.primaryColor,
      fontSize: 17,
      fontWeight: FontWeight.bold);
  static const TextStyle secendryText = TextStyle(
      fontFamily: AppString.fontFamily,
      color: AppColors.mainColor,
      fontSize: 15,
      fontWeight: FontWeight.w100);
}
