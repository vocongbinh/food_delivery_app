import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/components/reuseable_text.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

import '../../values/app_constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.color, this.onTap});
  final String text;
  final Color? color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height * 0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor),
        child: Center(
          child: ReusableText(
              text: text,
              style: AppStyles.customeText(
                  16, color ?? AppColors.whiteColor, FontWeight.normal)),
        ),
      ),
    );
  }
}
