import 'package:food_delivery_app/models/dish.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CartItem {
  Dish dish;
  int amount;
}
