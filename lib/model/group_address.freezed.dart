// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupAddressModel _$GroupAddressModelFromJson(Map<String, dynamic> json) {
  return _GroupAddressModel.fromJson(json);
}

/// @nodoc
mixin _$GroupAddressModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(toJson: locationToJson, fromJson: locationFromJson)
  LatLng get location => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupAddressModelCopyWith<GroupAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupAddressModelCopyWith<$Res> {
  factory $GroupAddressModelCopyWith(
          GroupAddressModel value, $Res Function(GroupAddressModel) then) =
      _$GroupAddressModelCopyWithImpl<$Res, GroupAddressModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(toJson: locationToJson, fromJson: locationFromJson)
      LatLng location,
      String address});
}

/// @nodoc
class _$GroupAddressModelCopyWithImpl<$Res, $Val extends GroupAddressModel>
    implements $GroupAddressModelCopyWith<$Res> {
  _$GroupAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? location = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupAddressModelImplCopyWith<$Res>
    implements $GroupAddressModelCopyWith<$Res> {
  factory _$$GroupAddressModelImplCopyWith(_$GroupAddressModelImpl value,
          $Res Function(_$GroupAddressModelImpl) then) =
      __$$GroupAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(toJson: locationToJson, fromJson: locationFromJson)
      LatLng location,
      String address});
}

/// @nodoc
class __$$GroupAddressModelImplCopyWithImpl<$Res>
    extends _$GroupAddressModelCopyWithImpl<$Res, _$GroupAddressModelImpl>
    implements _$$GroupAddressModelImplCopyWith<$Res> {
  __$$GroupAddressModelImplCopyWithImpl(_$GroupAddressModelImpl _value,
      $Res Function(_$GroupAddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? location = null,
    Object? address = null,
  }) {
    return _then(_$GroupAddressModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupAddressModelImpl implements _GroupAddressModel {
  _$GroupAddressModelImpl(
      {this.id,
      @JsonKey(toJson: locationToJson, fromJson: locationFromJson)
      required this.location,
      required this.address});

  factory _$GroupAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupAddressModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(toJson: locationToJson, fromJson: locationFromJson)
  final LatLng location;
  @override
  final String address;

  @override
  String toString() {
    return 'GroupAddressModel(id: $id, location: $location, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupAddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, location, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupAddressModelImplCopyWith<_$GroupAddressModelImpl> get copyWith =>
      __$$GroupAddressModelImplCopyWithImpl<_$GroupAddressModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupAddressModelImplToJson(
      this,
    );
  }
}

abstract class _GroupAddressModel implements GroupAddressModel {
  factory _GroupAddressModel(
      {final int? id,
      @JsonKey(toJson: locationToJson, fromJson: locationFromJson)
      required final LatLng location,
      required final String address}) = _$GroupAddressModelImpl;

  factory _GroupAddressModel.fromJson(Map<String, dynamic> json) =
      _$GroupAddressModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(toJson: locationToJson, fromJson: locationFromJson)
  LatLng get location;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$GroupAddressModelImplCopyWith<_$GroupAddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
