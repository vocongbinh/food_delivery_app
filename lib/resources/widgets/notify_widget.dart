import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';

class NotifyWidget extends StatelessWidget {
  const NotifyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 10),
      child: badges.Badge(
        child: IconButton(
          icon: Image.asset(AppAssets.notifyIcon),
          onPressed: () {},
          style: IconButton.styleFrom(backgroundColor: AppColors.blackColor),
        ),
        badgeContent: Container(
          child: Center(
            child: Text(
              '2',
              style: TextStyle(color: AppColors.whiteColor),
            ),
          ),
          padding: EdgeInsets.all(4),
        ),
        badgeStyle: badges.BadgeStyle(badgeColor: AppColors.primaryColor),
      ),
    );
  }
}
