import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/resources/widgets/dish_item_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  Dish dish = Dish(name: 'Binh', price: 10, image: AppAssets.testUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset(AppAssets.backIcon),
            onPressed: () {
              Get.back(result: "");
            },
            style: IconButton.styleFrom(
              backgroundColor: AppColors.bgButtonColor,
            )),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xffcccccc)),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Get.arguments.toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              child: Icon(
                Icons.search,
                color: AppColors.whiteColor,
              ),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 16, left: 6),
            child: IconButton(
              onPressed: () {},
              icon: Container(
                child: Icon(Icons.tune),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xffecf0f4),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
            ),
            Text('Popular ${Get.arguments}', style: AppStyles.header),
            DishItemWidget(
              item: dish,
              showPrice: true,
            )
          ],
        ),
      ),
    );
  }
}
