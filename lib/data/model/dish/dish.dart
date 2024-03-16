import 'package:freezed_annotation/freezed_annotation.dart';
part 'dish.g.dart';
part 'dish.freezed.dart';

@Freezed()
class Dish with _$Dish {
  const factory Dish({
    required String name,
    required int price,
    required String image,
  }) = _Dish;
  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
}
