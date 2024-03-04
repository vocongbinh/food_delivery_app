import 'package:flutter/material.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_styles.dart';

Widget HeaderWidget(text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '${text}',
        style: AppStyles.header,
      ),
      TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                'See All',
                style: AppStyles.h4,
              ),
            ),
            Image.asset(AppAssets.rightIcon)
          ],
        ),
      )
    ],
  );
}
