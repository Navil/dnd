// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupModelImpl _$$GroupModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupModelImpl(
      id: json['id'] as int?,
      isRemote: json['is_remote'] as bool,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      description: json['description'] as String,
      ownerId: json['owner_id'] as String,
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_remote': instance.isRemote,
      'title': instance.title,
      'description': instance.description,
      'owner_id': instance.ownerId,
    };
