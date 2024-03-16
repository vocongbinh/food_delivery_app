import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.g.dart';
part 'category.freezed.dart';

@Freezed()
class Category with _$Category {
  const factory Category({
    required String name,
    required String image,
  }) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
