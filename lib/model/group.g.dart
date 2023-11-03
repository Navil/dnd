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
<<<<<<< HEAD
      members: (json['members'] as List<dynamic>?)
=======
      members: (json['users'] as List<dynamic>?)
>>>>>>> 49d59048d785cba2cc6c0af0426a36c5ebb12331
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
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
  return val;
}
