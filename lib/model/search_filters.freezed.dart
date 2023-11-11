// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchFilters _$SearchFiltersFromJson(Map<String, dynamic> json) {
  return _SearchFilters.fromJson(json);
}

/// @nodoc
mixin _$SearchFilters {
  @JsonKey(name: "remote")
  bool get isRemote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchFiltersCopyWith<SearchFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFiltersCopyWith<$Res> {
  factory $SearchFiltersCopyWith(
          SearchFilters value, $Res Function(SearchFilters) then) =
      _$SearchFiltersCopyWithImpl<$Res, SearchFilters>;
  @useResult
  $Res call({@JsonKey(name: "remote") bool isRemote});
}

/// @nodoc
class _$SearchFiltersCopyWithImpl<$Res, $Val extends SearchFilters>
    implements $SearchFiltersCopyWith<$Res> {
  _$SearchFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRemote = null,
  }) {
    return _then(_value.copyWith(
      isRemote: null == isRemote
          ? _value.isRemote
          : isRemote // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchFiltersImplCopyWith<$Res>
    implements $SearchFiltersCopyWith<$Res> {
  factory _$$SearchFiltersImplCopyWith(
          _$SearchFiltersImpl value, $Res Function(_$SearchFiltersImpl) then) =
      __$$SearchFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "remote") bool isRemote});
}

/// @nodoc
class __$$SearchFiltersImplCopyWithImpl<$Res>
    extends _$SearchFiltersCopyWithImpl<$Res, _$SearchFiltersImpl>
    implements _$$SearchFiltersImplCopyWith<$Res> {
  __$$SearchFiltersImplCopyWithImpl(
      _$SearchFiltersImpl _value, $Res Function(_$SearchFiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRemote = null,
  }) {
    return _then(_$SearchFiltersImpl(
      isRemote: null == isRemote
          ? _value.isRemote
          : isRemote // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchFiltersImpl implements _SearchFilters {
  _$SearchFiltersImpl({@JsonKey(name: "remote") this.isRemote = true});

  factory _$SearchFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchFiltersImplFromJson(json);

  @override
  @JsonKey(name: "remote")
  final bool isRemote;

  @override
  String toString() {
    return 'SearchFilters(isRemote: $isRemote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFiltersImpl &&
            (identical(other.isRemote, isRemote) ||
                other.isRemote == isRemote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isRemote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFiltersImplCopyWith<_$SearchFiltersImpl> get copyWith =>
      __$$SearchFiltersImplCopyWithImpl<_$SearchFiltersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchFiltersImplToJson(
      this,
    );
  }
}

abstract class _SearchFilters implements SearchFilters {
  factory _SearchFilters({@JsonKey(name: "remote") final bool isRemote}) =
      _$SearchFiltersImpl;

  factory _SearchFilters.fromJson(Map<String, dynamic> json) =
      _$SearchFiltersImpl.fromJson;

  @override
  @JsonKey(name: "remote")
  bool get isRemote;
  @override
  @JsonKey(ignore: true)
  _$$SearchFiltersImplCopyWith<_$SearchFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
