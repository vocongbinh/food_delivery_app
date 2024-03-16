import 'package:food_delivery_app/models/restaurant.dart';
import 'package:get/get.dart';

class Dish extends GetxController {
  String name;
  int price;

  Dish({required this.name, required this.price});
}
