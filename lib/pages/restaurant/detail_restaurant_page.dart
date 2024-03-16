import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/models/dish.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/restaurant/widgets/dishes_widget.dart';
import 'package:food_delivery_app/resources/widgets/back_button_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class DetailRestaurantPage extends StatefulWidget {
  const DetailRestaurantPage({super.key});

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  List<Dish> dishes = Get.arguments.dishes;
  int selectedFood = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(
          () {
            Get.back();
          },
        ),
        title: Text(
          'Restaurant View',
          style: AppStyles.h4,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 40),
                height: height * 1 / 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppAssets.testImg),
                    )),
              ),
              Text(
                'Restaurant',
                style: AppStyles.header.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'hihihihihihihi',
                  style: AppStyles.h4.copyWith(color: AppColors.subTextColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(AppAssets.rateIcon),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            2.3.toStringAsFixed(1),
                            style: AppStyles.h4
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(AppAssets.deliveryIcon),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text('free', style: AppStyles.h4),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(AppAssets.clockIcon),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text('20 min', style: AppStyles.h4),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: ListView.separated(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFood = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: Center(
                              child: Text(
                                dishes[index].name,
                                style: AppStyles.h4.copyWith(
                                    color: selectedFood == index
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: selectedFood == index
                                    ? AppColors.primaryColor
                                    : AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                    color: selectedFood == index
                                        ? AppColors.primaryColor
                                        : Color(0xffededed),
                                    width: 2)),
                          ));
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 30,
                        ),
                    itemCount: dishes.length),
              ),
              SizedBox(height: 30),
              DishesWidget(title: dishes[selectedFood].name, dishes: dishes)
            ],
          ),
        ),
      ),
    );
  }
}
