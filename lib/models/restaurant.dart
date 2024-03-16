import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:get/get.dart';

class Restaurant extends GetxController {
  String image;
  String name;
  List<Dish> dishes;
  double rate;
  Restaurant(
      {required this.image,
      required this.name,
      required this.dishes,
      this.rate = 0});
}
