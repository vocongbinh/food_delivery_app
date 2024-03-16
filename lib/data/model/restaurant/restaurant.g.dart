// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      name: json['name'] as String,
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      dishes: (json['dishes'] as List<dynamic>)
          .map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'rate': instance.rate,
      'dishes': instance.dishes,
      'image': instance.image,
    };
