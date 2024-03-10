import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@immutable
@JsonSerializable()
class Order {
  const Order(
      {required this.message, required this.userId, required this.orderId});
  final String message;
  final String userId;
  final String orderId;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
