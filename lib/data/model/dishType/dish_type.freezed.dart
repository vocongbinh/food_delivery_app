// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DishType _$DishTypeFromJson(Map<String, dynamic> json) {
  return _DishType.fromJson(json);
}

/// @nodoc
mixin _$DishType {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  dynamic get required => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishTypeCopyWith<DishType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishTypeCopyWith<$Res> {
  factory $DishTypeCopyWith(DishType value, $Res Function(DishType) then) =
      _$DishTypeCopyWithImpl<$Res, DishType>;
  @useResult
  $Res call({String name, int id, dynamic required});
}

/// @nodoc
class _$DishTypeCopyWithImpl<$Res, $Val extends DishType>
    implements $DishTypeCopyWith<$Res> {
  _$DishTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? required = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      required: freezed == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishTypeImplCopyWith<$Res>
    implements $DishTypeCopyWith<$Res> {
  factory _$$DishTypeImplCopyWith(
          _$DishTypeImpl value, $Res Function(_$DishTypeImpl) then) =
      __$$DishTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int id, dynamic required});
}

/// @nodoc
class __$$DishTypeImplCopyWithImpl<$Res>
    extends _$DishTypeCopyWithImpl<$Res, _$DishTypeImpl>
    implements _$$DishTypeImplCopyWith<$Res> {
  __$$DishTypeImplCopyWithImpl(
      _$DishTypeImpl _value, $Res Function(_$DishTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? required = freezed,
  }) {
    return _then(_$DishTypeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      required: freezed == required ? _value.required! : required,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DishTypeImpl implements _DishType {
  const _$DishTypeImpl({required this.name, required this.id, this.required});

  factory _$DishTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DishTypeImplFromJson(json);

  @override
  final String name;
  @override
  final int id;
  @override
  final dynamic required;

  @override
  String toString() {
    return 'DishType(name: $name, id: $id, required: $required)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishTypeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.required, required));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, id, const DeepCollectionEquality().hash(required));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DishTypeImplCopyWith<_$DishTypeImpl> get copyWith =>
      __$$DishTypeImplCopyWithImpl<_$DishTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DishTypeImplToJson(
      this,
    );
  }
}

abstract class _DishType implements DishType {
  const factory _DishType(
      {required final String name,
      required final int id,
      final dynamic required}) = _$DishTypeImpl;

  factory _DishType.fromJson(Map<String, dynamic> json) =
      _$DishTypeImpl.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  dynamic get required;
  @override
  @JsonKey(ignore: true)
  _$$DishTypeImplCopyWith<_$DishTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
