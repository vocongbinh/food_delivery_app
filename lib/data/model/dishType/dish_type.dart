import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dish_type.g.dart';
part 'dish_type.freezed.dart';

@Freezed()
class DishType with _$DishType {
  const factory DishType({required String name, required int id, required}) =
      _DishType;
  factory DishType.fromJson(Map<String, dynamic> json) =>
      _$DishTypeFromJson(json);
}
