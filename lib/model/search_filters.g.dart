// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchFiltersImpl _$$SearchFiltersImplFromJson(Map<String, dynamic> json) =>
    _$SearchFiltersImpl(
      isRemote: json['remote'] as bool? ?? true,
      groupLanguage: json['lang'] as String? ?? "en",
    );

Map<String, dynamic> _$$SearchFiltersImplToJson(_$SearchFiltersImpl instance) =>
    <String, dynamic>{
      'remote': instance.isRemote,
      'lang': instance.groupLanguage,
    };
