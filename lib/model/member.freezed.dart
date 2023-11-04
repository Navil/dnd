// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) {
  return _MemberModel.fromJson(json);
}

/// @nodoc
mixin _$MemberModel {
  @JsonKey(name: "group_id")
  int get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "is_dm")
  bool get isDm => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, name: "users")
  UserModel? get user => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, name: "groups")
  GroupModel? get group => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberModelCopyWith<MemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberModelCopyWith<$Res> {
  factory $MemberModelCopyWith(
          MemberModel value, $Res Function(MemberModel) then) =
      _$MemberModelCopyWithImpl<$Res, MemberModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "group_id") int groupId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "is_dm") bool isDm,
      @JsonKey(includeToJson: false, name: "created_at") DateTime createdAt,
      @JsonKey(includeToJson: false, name: "users") UserModel? user,
      @JsonKey(includeToJson: false, name: "groups") GroupModel? group});

  $UserModelCopyWith<$Res>? get user;
  $GroupModelCopyWith<$Res>? get group;
}

/// @nodoc
class _$MemberModelCopyWithImpl<$Res, $Val extends MemberModel>
    implements $MemberModelCopyWith<$Res> {
  _$MemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? userId = null,
    Object? isDm = null,
    Object? createdAt = null,
    Object? user = freezed,
    Object? group = freezed,
  }) {
    return _then(_value.copyWith(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isDm: null == isDm
          ? _value.isDm
          : isDm // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as GroupModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupModelCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $GroupModelCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemberModelImplCopyWith<$Res>
    implements $MemberModelCopyWith<$Res> {
  factory _$$MemberModelImplCopyWith(
          _$MemberModelImpl value, $Res Function(_$MemberModelImpl) then) =
      __$$MemberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "group_id") int groupId,
      @JsonKey(name: "user_id") String userId,
      @JsonKey(name: "is_dm") bool isDm,
      @JsonKey(includeToJson: false, name: "created_at") DateTime createdAt,
      @JsonKey(includeToJson: false, name: "users") UserModel? user,
      @JsonKey(includeToJson: false, name: "groups") GroupModel? group});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $GroupModelCopyWith<$Res>? get group;
}

/// @nodoc
class __$$MemberModelImplCopyWithImpl<$Res>
    extends _$MemberModelCopyWithImpl<$Res, _$MemberModelImpl>
    implements _$$MemberModelImplCopyWith<$Res> {
  __$$MemberModelImplCopyWithImpl(
      _$MemberModelImpl _value, $Res Function(_$MemberModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? userId = null,
    Object? isDm = null,
    Object? createdAt = null,
    Object? user = freezed,
    Object? group = freezed,
  }) {
    return _then(_$MemberModelImpl(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isDm: null == isDm
          ? _value.isDm
          : isDm // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as GroupModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberModelImpl implements _MemberModel {
  _$MemberModelImpl(
      {@JsonKey(name: "group_id") required this.groupId,
      @JsonKey(name: "user_id") required this.userId,
      @JsonKey(name: "is_dm") required this.isDm,
      @JsonKey(includeToJson: false, name: "created_at")
      required this.createdAt,
      @JsonKey(includeToJson: false, name: "users") this.user,
      @JsonKey(includeToJson: false, name: "groups") this.group});

  factory _$MemberModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberModelImplFromJson(json);

  @override
  @JsonKey(name: "group_id")
  final int groupId;
  @override
  @JsonKey(name: "user_id")
  final String userId;
  @override
  @JsonKey(name: "is_dm")
  final bool isDm;
  @override
  @JsonKey(includeToJson: false, name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(includeToJson: false, name: "users")
  final UserModel? user;
  @override
  @JsonKey(includeToJson: false, name: "groups")
  final GroupModel? group;

  @override
  String toString() {
    return 'MemberModel(groupId: $groupId, userId: $userId, isDm: $isDm, createdAt: $createdAt, user: $user, group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberModelImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isDm, isDm) || other.isDm == isDm) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, groupId, userId, isDm, createdAt, user, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberModelImplCopyWith<_$MemberModelImpl> get copyWith =>
      __$$MemberModelImplCopyWithImpl<_$MemberModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberModelImplToJson(
      this,
    );
  }
}

abstract class _MemberModel implements MemberModel {
  factory _MemberModel(
      {@JsonKey(name: "group_id") required final int groupId,
      @JsonKey(name: "user_id") required final String userId,
      @JsonKey(name: "is_dm") required final bool isDm,
      @JsonKey(includeToJson: false, name: "created_at")
      required final DateTime createdAt,
      @JsonKey(includeToJson: false, name: "users") final UserModel? user,
      @JsonKey(includeToJson: false, name: "groups")
      final GroupModel? group}) = _$MemberModelImpl;

  factory _MemberModel.fromJson(Map<String, dynamic> json) =
      _$MemberModelImpl.fromJson;

  @override
  @JsonKey(name: "group_id")
  int get groupId;
  @override
  @JsonKey(name: "user_id")
  String get userId;
  @override
  @JsonKey(name: "is_dm")
  bool get isDm;
  @override
  @JsonKey(includeToJson: false, name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(includeToJson: false, name: "users")
  UserModel? get user;
  @override
  @JsonKey(includeToJson: false, name: "groups")
  GroupModel? get group;
  @override
  @JsonKey(ignore: true)
  _$$MemberModelImplCopyWith<_$MemberModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
