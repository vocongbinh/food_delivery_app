import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_colors.dart';

class AppStyles {
  static TextStyle h4 =
      TextStyle(fontSize: 16, color: AppColors.blackColor, fontFamily: 'Sen');
  static TextStyle header =
      TextStyle(fontSize: 20, color: AppColors.blackColor, fontFamily: 'Sen');
  static TextStyle customeText(
      double size, Color color, FontWeight fontWeight) {
    return TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        fontFamily: 'Sen');
  }

  static BoxDecoration boxOutline = BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: AppColors.whiteColor,
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 209, 203, 203),
            spreadRadius: 2,
            blurRadius: 8)
      ]);
}
