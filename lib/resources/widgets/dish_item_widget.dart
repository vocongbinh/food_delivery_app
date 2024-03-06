import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/models/dish.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';

class DishItemWidget extends StatelessWidget {
  final Dish item;
  const DishItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return
        //  Container(
        //   width: 200,
        //   height: 100,
        //   decoration: BoxDecoration(color: Colors.red),
        //   child: Container(
        //       // margin: EdgeInsets.only(bottom: 100),
        //       padding: EdgeInsets.symmetric(ho),
        //       width: 50,
        //       height: 84,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         image: DecorationImage(
        //             image: AssetImage(AppAssets.testImg), fit: BoxFit.cover),
        //       )),
        // );

        Stack(
      children: [
        Container(
          width: 150,
          height: 180,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: 150,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text(
                  item.name,
                  style: AppStyles.h4.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Uttora Coffee House  ',
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.h4.copyWith(
                      fontWeight: FontWeight.w400, color: Color(0xff646982)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 209, 203, 203),
                      spreadRadius: 2,
                      blurRadius: 8)
                ]),
          ),
        ),
        Positioned(
          top: 20,
          left: 14,
          child: Container(
              width: 122,
              height: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(AppAssets.testImg), fit: BoxFit.cover),
              )),
        ),
      ],
    );
  }
}
