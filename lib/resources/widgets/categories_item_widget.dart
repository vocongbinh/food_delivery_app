import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/category.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryItem item;
  CategoryItemWidget({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
      // margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 209, 203, 203),
                spreadRadius: 2,
                blurRadius: 8)
          ]),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(item.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '${item.name}',
              style: AppStyles.h4.copyWith(fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
