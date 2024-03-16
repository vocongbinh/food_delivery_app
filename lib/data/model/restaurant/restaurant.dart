import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant.g.dart';
part 'restaurant.freezed.dart';

@Freezed()
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String name,
    @Default(0) double rate,
    required List<Dish> dishes,
    required String image,
  }) = _Restaurant;
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}
