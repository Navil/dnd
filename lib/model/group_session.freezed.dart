// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupSessionModel _$GroupSessionModelFromJson(Map<String, dynamic> json) {
  return _GroupSessionModel.fromJson(json);
}

/// @nodoc
mixin _$GroupSessionModel {
  int? get id => throw _privateConstructorUsedError;
  int get weekday => throw _privateConstructorUsedError;
  @JsonKey(name: "start_time", fromJson: timeFromJson, toJson: timeToJson)
  TimeOfDay get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: "end_time", fromJson: timeFromJson, toJson: timeToJson)
  TimeOfDay get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupSessionModelCopyWith<GroupSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupSessionModelCopyWith<$Res> {
  factory $GroupSessionModelCopyWith(
          GroupSessionModel value, $Res Function(GroupSessionModel) then) =
      _$GroupSessionModelCopyWithImpl<$Res, GroupSessionModel>;
  @useResult
  $Res call(
      {int? id,
      int weekday,
      @JsonKey(name: "start_time", fromJson: timeFromJson, toJson: timeToJson)
      TimeOfDay startTime,
      @JsonKey(name: "end_time", fromJson: timeFromJson, toJson: timeToJson)
      TimeOfDay endTime});
}

/// @nodoc
class _$GroupSessionModelCopyWithImpl<$Res, $Val extends GroupSessionModel>
    implements $GroupSessionModelCopyWith<$Res> {
  _$GroupSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? weekday = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      weekday: null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupSessionModelImplCopyWith<$Res>
    implements $GroupSessionModelCopyWith<$Res> {
  factory _$$GroupSessionModelImplCopyWith(_$GroupSessionModelImpl value,
          $Res Function(_$GroupSessionModelImpl) then) =
      __$$GroupSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int weekday,
      @JsonKey(name: "start_time", fromJson: timeFromJson, toJson: timeToJson)
      TimeOfDay startTime,
      @JsonKey(name: "end_time", fromJson: timeFromJson, toJson: timeToJson)
      TimeOfDay endTime});
}

/// @nodoc
class __$$GroupSessionModelImplCopyWithImpl<$Res>
    extends _$GroupSessionModelCopyWithImpl<$Res, _$GroupSessionModelImpl>
    implements _$$GroupSessionModelImplCopyWith<$Res> {
  __$$GroupSessionModelImplCopyWithImpl(_$GroupSessionModelImpl _value,
      $Res Function(_$GroupSessionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? weekday = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$GroupSessionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      weekday: null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupSessionModelImpl implements _GroupSessionModel {
  _$GroupSessionModelImpl(
      {this.id,
      required this.weekday,
      @JsonKey(name: "start_time", fromJson: timeFromJson, toJson: timeToJson)
      required this.startTime,
      @JsonKey(name: "end_time", fromJson: timeFromJson, toJson: timeToJson)
      required this.endTime});

  factory _$GroupSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupSessionModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int weekday;
  @override
  @JsonKey(name: "start_time", fromJson: timeFromJson, toJson: timeToJson)
  final TimeOfDay startTime;
  @override
  @JsonKey(name: "end_time", fromJson: timeFromJson, toJson: timeToJson)
  final TimeOfDay endTime;

  @override
  String toString() {
    return 'GroupSessionModel(id: $id, weekday: $weekday, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupSessionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, weekday, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupSessionModelImplCopyWith<_$GroupSessionModelImpl> get copyWith =>
      __$$GroupSessionModelImplCopyWithImpl<_$GroupSessionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupSessionModelImplToJson(
      this,
    );
  }
}

abstract class _GroupSessionModel implements GroupSessionModel {
  factory _GroupSessionModel(
      {final int? id,
      required final int weekday,
      @JsonKey(name: "start_time", fromJson: timeFromJson, toJson: timeToJson)
      required final TimeOfDay startTime,
      @JsonKey(name: "end_time", fromJson: timeFromJson, toJson: timeToJson)
      required final TimeOfDay endTime}) = _$GroupSessionModelImpl;

  factory _GroupSessionModel.fromJson(Map<String, dynamic> json) =
      _$GroupSessionModelImpl.fromJson;

  @override
  int? get id;
  @override
  int get weekday;
  @override
  @JsonKey(name: "start_time", fromJson: timeFromJson, toJson: timeToJson)
  TimeOfDay get startTime;
  @override
  @JsonKey(name: "end_time", fromJson: timeFromJson, toJson: timeToJson)
  TimeOfDay get endTime;
  @override
  @JsonKey(ignore: true)
  _$$GroupSessionModelImplCopyWith<_$GroupSessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
