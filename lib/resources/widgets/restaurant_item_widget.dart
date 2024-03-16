import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/restaurant/detail_restaurant_page.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class RestaurantItemWidget extends StatefulWidget {
  final Restaurant item;
  const RestaurantItemWidget({super.key, required this.item});

  @override
  State<RestaurantItemWidget> createState() => _RestaurantItemWidgetState();
}

class _RestaurantItemWidgetState extends State<RestaurantItemWidget> {
  @override
  Widget build(BuildContext context) {
    String listDish = widget.item.dishes.map((e) => e.name).join(" - ");
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailRestaurantPage(), arguments: widget.item);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppAssets.testImg),
                ),
              ),
            ),
            Text(
              '${widget.item.name}',
              style: AppStyles.header,
            ),
            Text(listDish,
                style: AppStyles.h4.copyWith(color: AppColors.subTextColor)),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(AppAssets.rateIcon),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        widget.item.rate.toStringAsFixed(1),
                        style:
                            AppStyles.h4.copyWith(fontWeight: FontWeight.w700),
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
            )
          ],
        ),
      ),
    );
  }
}
