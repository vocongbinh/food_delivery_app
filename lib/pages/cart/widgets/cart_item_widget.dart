import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/pages/cart/cart_widget.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem cart;

  const CartItemWidget({super.key, required this.cart});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find();
    Dish dish = widget.cart.dish;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(dish.image), fit: BoxFit.cover))),
          flex: 2,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dish.name,
                      style: AppStyles.h4.copyWith(
                        fontSize: 20,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Obx(() {
                      return !controller.isEdit.value
                          ? Container()
                          : IconButton(
                              onPressed: () {},
                              icon: Icon(
                                size: 30,
                                Icons.cancel,
                                color: Colors.red,
                              ));
                    })
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    '${dish.price.toString()} VND',
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Amount: ${widget.cart.amount.toString()}',
                  style: AppStyles.h4.copyWith(color: AppColors.whiteColor),
                )
              ],
            ),
          ),
          flex: 3,
        ),
      ],
    );
  }
}
