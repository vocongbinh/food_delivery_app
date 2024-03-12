// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      message: json['message'] as String,
      userId: json['userId'] as String,
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'message': instance.message,
      'userId': instance.userId,
      'orderId': instance.orderId,
    };
