// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberModelImpl _$$MemberModelImplFromJson(Map<String, dynamic> json) =>
    _$MemberModelImpl(
      groupId: json['group_id'] as int,
      userId: json['user_id'] as String,
      isDm: json['is_dm'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      user: json['users'] == null
          ? null
          : UserModel.fromJson(json['users'] as Map<String, dynamic>),
      group: json['groups'] == null
          ? null
          : GroupModel.fromJson(json['groups'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MemberModelImplToJson(_$MemberModelImpl instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'is_dm': instance.isDm,
    };
