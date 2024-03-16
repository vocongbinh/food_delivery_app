import 'package:food_delivery_app/data/model/dish/dish.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.g.dart';
part 'cart_item.freezed.dart';

@Freezed()
class CartItem with _$CartItem {
  const factory CartItem({required int amount, required Dish dish}) = _CartItem;
  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
