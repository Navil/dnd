// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupSessionModelImpl _$$GroupSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupSessionModelImpl(
      id: json['id'] as int?,
      weekday: json['weekday'] as int,
      startTime: timeFromJson(json['start_time']),
      endTime: timeFromJson(json['end_time']),
    );

Map<String, dynamic> _$$GroupSessionModelImplToJson(
        _$GroupSessionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weekday': instance.weekday,
      'start_time': timeToJson(instance.startTime),
      'end_time': timeToJson(instance.endTime),
    };
