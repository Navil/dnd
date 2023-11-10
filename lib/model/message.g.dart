// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      id: json['id'] as int?,
      createdAt: DateTime.parse(json['created_at'] as String),
      sender: UserModel.fromJson(json['users'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['users'] = instance.sender;
  val['message'] = instance.message;
  return val;
}
