import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class DetailFoodPage extends StatefulWidget {
  const DetailFoodPage({super.key});

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  Dish dish = Get.arguments;
  List<String> sizes = ['S', 'M', "L"];
  int selectedSize = -1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    int count = 0;
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
        title: Text(
          'Detail',
          style: AppStyles.h4,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 1 / 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppAssets.testImg),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Container(
                decoration: AppStyles.boxOutline,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppAssets.restaurant),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'House',
                        style: AppStyles.h4,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              dish.name,
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
              padding: const EdgeInsets.symmetric(vertical: 16),
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
            Row(
              children: [
                Text('Size:', style: AppStyles.h4),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 48,
                            child: IconButton(
                                icon: Text(
                                  sizes[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: selectedSize == index
                                          ? AppColors.whiteColor
                                          : AppColors.blackColor),
                                ),
                                onPressed: () {
                                  Get.bottomSheet(StatefulBuilder(
                                      builder: (context, setState) {
                                    return Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: AppColors.bgButton,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20))),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                (dish.price * count).toString(),
                                                style: TextStyle(
                                                    fontSize: 28,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color:
                                                        AppColors.blackColor),
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                        style: IconButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Color(0xff41414f),
                                                        ),
                                                        onPressed: () {
                                                          if (count > 0) {
                                                            setState(() {
                                                              count--;
                                                            });
                                                          }
                                                        },
                                                        icon: Icon(
                                                          Icons.remove,
                                                          color: AppColors
                                                              .whiteColor,
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16),
                                                      child: Text(
                                                        count.toString(),
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .whiteColor,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        style: IconButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              Color(0xff41414f),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            count++;
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: AppColors
                                                              .whiteColor,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 12),
                                                  child: Text(
                                                    'ADD TO CARD',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(AppColors
                                                                .primaryColor),
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    )))),
                                          )
                                        ],
                                      ),
                                    );
                                  }));
                                  setState(() {
                                    selectedSize = index;
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            selectedSize == index
                                                ? AppColors.primaryColor
                                                : AppColors.bgButton),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )))),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        itemCount: sizes.length),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
