// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) {
  return _GroupModel.fromJson(json);
}

/// @nodoc
mixin _$GroupModel {
  @JsonKey(includeIfNull: false)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "is_remote")
  bool get isRemote => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "owner_id")
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: "group_addresses", includeToJson: false)
  GroupAddressModel? get address => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  List<MemberModel>? get members => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupModelCopyWith<GroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupModelCopyWith<$Res> {
  factory $GroupModelCopyWith(
          GroupModel value, $Res Function(GroupModel) then) =
      _$GroupModelCopyWithImpl<$Res, GroupModel>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(name: "is_remote") bool isRemote,
      String title,
      @JsonKey(includeToJson: false, name: "created_at") DateTime createdAt,
      String description,
      @JsonKey(name: "owner_id") String ownerId,
      @JsonKey(name: "group_addresses", includeToJson: false)
      GroupAddressModel? address,
      @JsonKey(includeToJson: false) List<MemberModel>? members});

  $GroupAddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class _$GroupModelCopyWithImpl<$Res, $Val extends GroupModel>
    implements $GroupModelCopyWith<$Res> {
  _$GroupModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isRemote = null,
    Object? title = null,
    Object? createdAt = null,
    Object? description = null,
    Object? ownerId = null,
    Object? address = freezed,
    Object? members = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isRemote: null == isRemote
          ? _value.isRemote
          : isRemote // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as GroupAddressModel?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupAddressModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $GroupAddressModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupModelImplCopyWith<$Res>
    implements $GroupModelCopyWith<$Res> {
  factory _$$GroupModelImplCopyWith(
          _$GroupModelImpl value, $Res Function(_$GroupModelImpl) then) =
      __$$GroupModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(name: "is_remote") bool isRemote,
      String title,
      @JsonKey(includeToJson: false, name: "created_at") DateTime createdAt,
      String description,
      @JsonKey(name: "owner_id") String ownerId,
      @JsonKey(name: "group_addresses", includeToJson: false)
      GroupAddressModel? address,
      @JsonKey(includeToJson: false) List<MemberModel>? members});

  @override
  $GroupAddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class __$$GroupModelImplCopyWithImpl<$Res>
    extends _$GroupModelCopyWithImpl<$Res, _$GroupModelImpl>
    implements _$$GroupModelImplCopyWith<$Res> {
  __$$GroupModelImplCopyWithImpl(
      _$GroupModelImpl _value, $Res Function(_$GroupModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isRemote = null,
    Object? title = null,
    Object? createdAt = null,
    Object? description = null,
    Object? ownerId = null,
    Object? address = freezed,
    Object? members = freezed,
  }) {
    return _then(_$GroupModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isRemote: null == isRemote
          ? _value.isRemote
          : isRemote // ignore: cast_nullable_to_non_nullable
              as bool,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as GroupAddressModel?,
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<MemberModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupModelImpl implements _GroupModel {
  _$GroupModelImpl(
      {@JsonKey(includeIfNull: false) this.id,
      @JsonKey(name: "is_remote") required this.isRemote,
      required this.title,
      @JsonKey(includeToJson: false, name: "created_at")
      required this.createdAt,
      required this.description,
      @JsonKey(name: "owner_id") required this.ownerId,
      @JsonKey(name: "group_addresses", includeToJson: false) this.address,
      @JsonKey(includeToJson: false) final List<MemberModel>? members})
      : _members = members;

  factory _$GroupModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupModelImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final int? id;
  @override
  @JsonKey(name: "is_remote")
  final bool isRemote;
  @override
  final String title;
  @override
  @JsonKey(includeToJson: false, name: "created_at")
  final DateTime createdAt;
  @override
  final String description;
  @override
  @JsonKey(name: "owner_id")
  final String ownerId;
  @override
  @JsonKey(name: "group_addresses", includeToJson: false)
  final GroupAddressModel? address;
  final List<MemberModel>? _members;
  @override
  @JsonKey(includeToJson: false)
  List<MemberModel>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GroupModel(id: $id, isRemote: $isRemote, title: $title, createdAt: $createdAt, description: $description, ownerId: $ownerId, address: $address, members: $members)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isRemote, isRemote) ||
                other.isRemote == isRemote) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isRemote,
      title,
      createdAt,
      description,
      ownerId,
      address,
      const DeepCollectionEquality().hash(_members));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupModelImplCopyWith<_$GroupModelImpl> get copyWith =>
      __$$GroupModelImplCopyWithImpl<_$GroupModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupModelImplToJson(
      this,
    );
  }
}

abstract class _GroupModel implements GroupModel {
  factory _GroupModel(
          {@JsonKey(includeIfNull: false) final int? id,
          @JsonKey(name: "is_remote") required final bool isRemote,
          required final String title,
          @JsonKey(includeToJson: false, name: "created_at")
          required final DateTime createdAt,
          required final String description,
          @JsonKey(name: "owner_id") required final String ownerId,
          @JsonKey(name: "group_addresses", includeToJson: false)
          final GroupAddressModel? address,
          @JsonKey(includeToJson: false) final List<MemberModel>? members}) =
      _$GroupModelImpl;

  factory _GroupModel.fromJson(Map<String, dynamic> json) =
      _$GroupModelImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  int? get id;
  @override
  @JsonKey(name: "is_remote")
  bool get isRemote;
  @override
  String get title;
  @override
  @JsonKey(includeToJson: false, name: "created_at")
  DateTime get createdAt;
  @override
  String get description;
  @override
  @JsonKey(name: "owner_id")
  String get ownerId;
  @override
  @JsonKey(name: "group_addresses", includeToJson: false)
  GroupAddressModel? get address;
  @override
  @JsonKey(includeToJson: false)
  List<MemberModel>? get members;
  @override
  @JsonKey(ignore: true)
  _$$GroupModelImplCopyWith<_$GroupModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
