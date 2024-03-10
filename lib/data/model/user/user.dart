import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User {
  const User(
    this.username,
    this.password, {
    this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  final int? id;
  final String name;
  final String email;
  final Gender gender;
  final String username;
  final String password;
  @JsonKey(name: "status")
  final UserStatus status;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonEnum()
enum Gender { male, female, all }

@JsonEnum()
enum UserStatus { inactive, active, all }
