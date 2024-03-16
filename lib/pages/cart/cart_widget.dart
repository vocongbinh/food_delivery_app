import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/widgets/back_button_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121223),
      appBar: AppBar(
        backgroundColor: Color(0xff121223),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 16,
              color: AppColors.whiteColor,
            ),
            onPressed: () {
              Get.back();
            },
            style: IconButton.styleFrom(
              backgroundColor: Color(0xff2a2a39),
            )),
        title: Text(
          'Cart',
          style:
              AppStyles.h4.copyWith(fontSize: 18, color: AppColors.whiteColor),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text('EDIT ITEMS',
                  style: AppStyles.h4.copyWith(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                    color: AppColors.primaryColor,
                  )))
        ],
      ),
    );
  }
}
