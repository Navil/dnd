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
      createdAt: DateTime.parse(json['created_at'] as String),
      description: json['description'] as String,
      ownerId: json['owner_id'] as String,
      address: json['group_addresses'] == null
          ? null
          : GroupAddressModel.fromJson(
              json['group_addresses'] as Map<String, dynamic>),
      language: json['language'] as String,
      chat: json['chat'] == null
          ? null
          : ChatModel.fromJson(json['chat'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['is_remote'] = instance.isRemote;
  val['title'] = instance.title;
  val['description'] = instance.description;
  val['owner_id'] = instance.ownerId;
  val['language'] = instance.language;
  return val;
}
