import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/data/api/dishType/dish_type_api.dart';
import 'package:food_delivery_app/data/model/category/category.dart';
import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:food_delivery_app/data/model/dishType/dish_type.dart';
import 'package:food_delivery_app/data/model/restaurant/restaurant.dart';
import 'package:food_delivery_app/models/user.dart';
import 'package:food_delivery_app/pages/location/add_location_page.dart';
import 'package:food_delivery_app/pages/search/search_page.dart';
import 'package:food_delivery_app/repository/dish_type_repository.dart';
import 'package:food_delivery_app/repository/user_repository.dart';
import 'package:food_delivery_app/resources/widgets/categories_item_widget.dart';
import 'package:food_delivery_app/resources/widgets/header_widget.dart';
import 'package:food_delivery_app/resources/widgets/notify_widget.dart';
import 'package:food_delivery_app/resources/widgets/restaurant_item_widget.dart';
import 'package:food_delivery_app/services/location_service.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<CategoryItemWidget> getCategories(categories) {
  return categories.map((category) => CategoryItemWidget(item: category));
}

String getSession() {
  DateTime currentDate = DateTime.now();

  if (currentDate.hour < 12)
    return 'Morning';
  else if (currentDate.hour <= 13)
    return 'Noon';
  else if (currentDate.hour <= 18)
    return 'Afternoon';
  else
    return 'Evening';
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  final LocationController locationController = Get.find<LocationController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = User(
      name: 'Binh',
      phoneNumber: '097834342',
    );
    DishTypeRepository dishTypeRepository = Get.find();
    List<DishType> categories = [
      DishType(id: 1, name: 'All'),
      DishType(id: 1, name: 'All'),
      DishType(id: 1, name: 'All'),
      DishType(id: 1, name: 'All'),
    ];
    List<Dish> dishes = [
      Dish(name: 'Burger', price: 10, image: AppAssets.testUrl),
      Dish(name: 'Burger', price: 10, image: AppAssets.testUrl),
      Dish(name: 'Burger', price: 10, image: AppAssets.testUrl),
      Dish(name: 'Burger', price: 10, image: AppAssets.testUrl),
    ];
    Restaurant restaurant = new Restaurant(
        image: AppAssets.testUrl,
        name: "Rose Garden Restaurant",
        dishes: dishes);

    return Obx(() {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
                icon: Image.asset(AppAssets.menuIcon),
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.bgButtonColor,
                )),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DELIVER TO',
                  style: AppStyles.h4.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => AddLocationPage());
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 200,
                            child: Text(
                              '${locationController.address.value}',
                              overflow: TextOverflow.clip,
                              style: AppStyles.h4.copyWith(
                                  fontSize: 14, color: Color(0xff676767)),
                            ),
                          ),
                        ),
                        Image.asset(
                          AppAssets.polygonIcon,
                          width: 14,
                        )
                      ],
                    ))
              ],
            ),
            actions: [NotifyWidget()],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Hey ${user.name}, ',
                        style: AppStyles.h4,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Good ${getSession()}!',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) async {
                        var data =
                            await Get.to(() => SearchPage(), arguments: value);
                        if (data == '') {
                          searchController.value = TextEditingValue(text: '');
                        }
                      },
                      controller: searchController,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          filled: true,
                          hintStyle: TextStyle(color: Color(0xff676767)),
                          fillColor: Color(0xfff6f6f6),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Search dishes, restaurants',
                          prefixIconColor: Color(0xffa0a5ba),
                          prefixIcon: Image.asset(AppAssets.searchIcon)),
                    ),
                    HeaderWidget('All Categories'),
                    SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                        future: dishTypeRepository.getAll(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else
                            return Container(
                              height: 64,
                              child: ListView.separated(
                                clipBehavior: Clip.none,
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 30,
                                ),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return CategoryItemWidget(
                                      item: snapshot.data![index]);
                                },
                              ),
                            );
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    HeaderWidget('Open Restaurants'),
                    RestaurantItemWidget(
                      item: restaurant,
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
