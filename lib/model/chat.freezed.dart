// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  @JsonKey(includeIfNull: false)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at", includeToJson: false)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, name: "groups")
  GroupModel get group => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  List<MessageModel>? get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(name: "created_at", includeToJson: false) DateTime createdAt,
      @JsonKey(includeToJson: false, name: "groups") GroupModel group,
      @JsonKey(includeToJson: false) List<MessageModel>? messages});

  $GroupModelCopyWith<$Res> get group;
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = null,
    Object? group = null,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as GroupModel,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupModelCopyWith<$Res> get group {
    return $GroupModelCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatModelImplCopyWith<$Res>
    implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(
          _$ChatModelImpl value, $Res Function(_$ChatModelImpl) then) =
      __$$ChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(name: "created_at", includeToJson: false) DateTime createdAt,
      @JsonKey(includeToJson: false, name: "groups") GroupModel group,
      @JsonKey(includeToJson: false) List<MessageModel>? messages});

  @override
  $GroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl>
    implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(
      _$ChatModelImpl _value, $Res Function(_$ChatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = null,
    Object? group = null,
    Object? messages = freezed,
  }) {
    return _then(_$ChatModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as GroupModel,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatModelImpl implements _ChatModel {
  _$ChatModelImpl(
      {@JsonKey(includeIfNull: false) this.id,
      @JsonKey(name: "created_at", includeToJson: false)
      required this.createdAt,
      @JsonKey(includeToJson: false, name: "groups") required this.group,
      @JsonKey(includeToJson: false) final List<MessageModel>? messages})
      : _messages = messages;

  factory _$ChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatModelImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final int? id;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  final DateTime createdAt;
  @override
  @JsonKey(includeToJson: false, name: "groups")
  final GroupModel group;
  final List<MessageModel>? _messages;
  @override
  @JsonKey(includeToJson: false)
  List<MessageModel>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChatModel(id: $id, createdAt: $createdAt, group: $group, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.group, group) || other.group == group) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, group,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatModelImplToJson(
      this,
    );
  }
}

abstract class _ChatModel implements ChatModel {
  factory _ChatModel(
          {@JsonKey(includeIfNull: false) final int? id,
          @JsonKey(name: "created_at", includeToJson: false)
          required final DateTime createdAt,
          @JsonKey(includeToJson: false, name: "groups")
          required final GroupModel group,
          @JsonKey(includeToJson: false) final List<MessageModel>? messages}) =
      _$ChatModelImpl;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$ChatModelImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  int? get id;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  DateTime get createdAt;
  @override
  @JsonKey(includeToJson: false, name: "groups")
  GroupModel get group;
  @override
  @JsonKey(includeToJson: false)
  List<MessageModel>? get messages;
  @override
  @JsonKey(ignore: true)
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
