// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  @JsonKey(name: "picture_url")
  String? get pictureUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "experience_level")
  ExperienceLevel get experienceLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "last_online")
  DateTime get lastOnline => throw _privateConstructorUsedError;
  @JsonKey(name: "timezone_offset")
  int get timezoneOffset => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String firstname,
      @JsonKey(name: "picture_url") String? pictureUrl,
      @JsonKey(name: "experience_level") ExperienceLevel experienceLevel,
      @JsonKey(name: "last_online") DateTime lastOnline,
      @JsonKey(name: "timezone_offset") int timezoneOffset,
      @JsonKey(includeToJson: false, name: "created_at") DateTime createdAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstname = null,
    Object? pictureUrl = freezed,
    Object? experienceLevel = null,
    Object? lastOnline = null,
    Object? timezoneOffset = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      experienceLevel: null == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as ExperienceLevel,
      lastOnline: null == lastOnline
          ? _value.lastOnline
          : lastOnline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timezoneOffset: null == timezoneOffset
          ? _value.timezoneOffset
          : timezoneOffset // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String firstname,
      @JsonKey(name: "picture_url") String? pictureUrl,
      @JsonKey(name: "experience_level") ExperienceLevel experienceLevel,
      @JsonKey(name: "last_online") DateTime lastOnline,
      @JsonKey(name: "timezone_offset") int timezoneOffset,
      @JsonKey(includeToJson: false, name: "created_at") DateTime createdAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstname = null,
    Object? pictureUrl = freezed,
    Object? experienceLevel = null,
    Object? lastOnline = null,
    Object? timezoneOffset = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      pictureUrl: freezed == pictureUrl
          ? _value.pictureUrl
          : pictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      experienceLevel: null == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as ExperienceLevel,
      lastOnline: null == lastOnline
          ? _value.lastOnline
          : lastOnline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timezoneOffset: null == timezoneOffset
          ? _value.timezoneOffset
          : timezoneOffset // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {required this.id,
      required this.firstname,
      @JsonKey(name: "picture_url") this.pictureUrl,
      @JsonKey(name: "experience_level") required this.experienceLevel,
      @JsonKey(name: "last_online") required this.lastOnline,
      @JsonKey(name: "timezone_offset") required this.timezoneOffset,
      @JsonKey(includeToJson: false, name: "created_at")
      required this.createdAt});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String firstname;
  @override
  @JsonKey(name: "picture_url")
  final String? pictureUrl;
  @override
  @JsonKey(name: "experience_level")
  final ExperienceLevel experienceLevel;
  @override
  @JsonKey(name: "last_online")
  final DateTime lastOnline;
  @override
  @JsonKey(name: "timezone_offset")
  final int timezoneOffset;
  @override
  @JsonKey(includeToJson: false, name: "created_at")
  final DateTime createdAt;

  @override
  String toString() {
    return 'UserModel(id: $id, firstname: $firstname, pictureUrl: $pictureUrl, experienceLevel: $experienceLevel, lastOnline: $lastOnline, timezoneOffset: $timezoneOffset, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.pictureUrl, pictureUrl) ||
                other.pictureUrl == pictureUrl) &&
            (identical(other.experienceLevel, experienceLevel) ||
                other.experienceLevel == experienceLevel) &&
            (identical(other.lastOnline, lastOnline) ||
                other.lastOnline == lastOnline) &&
            (identical(other.timezoneOffset, timezoneOffset) ||
                other.timezoneOffset == timezoneOffset) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstname, pictureUrl,
      experienceLevel, lastOnline, timezoneOffset, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String id,
      required final String firstname,
      @JsonKey(name: "picture_url") final String? pictureUrl,
      @JsonKey(name: "experience_level")
      required final ExperienceLevel experienceLevel,
      @JsonKey(name: "last_online") required final DateTime lastOnline,
      @JsonKey(name: "timezone_offset") required final int timezoneOffset,
      @JsonKey(includeToJson: false, name: "created_at")
      required final DateTime createdAt}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get firstname;
  @override
  @JsonKey(name: "picture_url")
  String? get pictureUrl;
  @override
  @JsonKey(name: "experience_level")
  ExperienceLevel get experienceLevel;
  @override
  @JsonKey(name: "last_online")
  DateTime get lastOnline;
  @override
  @JsonKey(name: "timezone_offset")
  int get timezoneOffset;
  @override
  @JsonKey(includeToJson: false, name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
