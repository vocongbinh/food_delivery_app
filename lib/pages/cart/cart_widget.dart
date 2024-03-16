import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/pages/cart/widgets/cart_item_widget.dart';
import 'package:food_delivery_app/resources/widgets/back_button_widget.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CartController extends GetxController {
  RxBool isEdit = false.obs;
  void setEdit(bool value) {
    isEdit.value = value;
  }
}

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    Dish dish = Dish(name: 'Burger', price: 10, image: AppAssets.testUrl);
    bool isEdit = false;
    List<CartItem> cartItems = [
      CartItem(amount: 2, dish: dish),
      CartItem(amount: 2, dish: dish)
    ];
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
            style: AppStyles.h4
                .copyWith(fontSize: 18, color: AppColors.whiteColor),
          ),
          actions: [
            Obx(() {
              return controller.isEdit.value
                  ? TextButton(
                      onPressed: () {
                        controller.isEdit.value = false;
                      },
                      child: Text('DONE',
                          style: AppStyles.h4.copyWith(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff059C6A),
                            color: Color(0xff059C6A),
                          )))
                  : TextButton(
                      onPressed: () {
                        controller.isEdit.value = true;
                      },
                      child: Text('EDIT ITEMS',
                          style: AppStyles.h4.copyWith(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                            color: AppColors.primaryColor,
                          )));
            }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
          child: ListView.separated(
              itemBuilder: ((context, index) {
                return CartItemWidget(cart: cartItems[index]);
              }),
              separatorBuilder: ((context, index) => SizedBox(
                    height: 40,
                  )),
              itemCount: cartItems.length),
        ));
  }
}
