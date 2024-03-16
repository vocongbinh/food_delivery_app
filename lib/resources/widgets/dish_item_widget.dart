import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/pages/food/detail_food_page.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class DishItemWidget extends StatelessWidget {
  final Dish item;
  final bool? showPrice;
  const DishItemWidget({super.key, required this.item, this.showPrice});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailFoodPage(), arguments: item);
      },
      child: Container(
        child: Stack(
          children: [
            Container(
              width: 150,
              height: showPrice == null ? 180 : 220,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 150,
                height: showPrice == null ? 100 : 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: showPrice == null ? 30 : 50),
                    Text(
                      item.name,
                      style: AppStyles.h4.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Uttora Coffee House',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.h4.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff646982)),
                      textAlign: TextAlign.center,
                    ),
                    showPrice != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.price.toString(),
                                style: AppStyles.h4
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                icon: Container(
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.whiteColor,
                                  ),
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                onPressed: () {},
                              )
                            ],
                          )
                        : Container()
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
                        image: AssetImage(AppAssets.testImg),
                        fit: BoxFit.cover),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
