// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      firstname: json['firstname'] as String,
      pictureUrl: json['picture_url'] as String?,
      experienceLevel:
          $enumDecode(_$ExperienceLevelEnumMap, json['experience_level']),
      lastOnline: DateTime.parse(json['last_online'] as String),
      timezoneOffset: json['timezone_offset'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'picture_url': instance.pictureUrl,
      'experience_level': _$ExperienceLevelEnumMap[instance.experienceLevel]!,
      'last_online': instance.lastOnline.toIso8601String(),
      'timezone_offset': instance.timezoneOffset,
    };

const _$ExperienceLevelEnumMap = {
  ExperienceLevel.beginner: 'beginner',
  ExperienceLevel.intermediate: 'intermediate',
  ExperienceLevel.experienced: 'experienced',
  ExperienceLevel.veteran: 'veteran',
};
