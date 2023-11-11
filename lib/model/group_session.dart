import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'group_session.freezed.dart';
part 'group_session.g.dart';

timeFromJson(dynamic json) {
  final jsonString = json.toString();
  final jsonParts = jsonString.split(":");
  final hours = int.parse(jsonParts[0]);
  final minutes = int.parse(jsonParts[1]);
  final timezoneOffset = DateTime.now().timeZoneOffset;
  return TimeOfDay(
      hour: hours + timezoneOffset.inHours,
      minute: minutes + timezoneOffset.inMinutes % 60);
}

timeToJson(TimeOfDay timeOfDay) {
  final timezoneOffset = DateTime.now().timeZoneOffset;
  return "${timeOfDay.hour - timezoneOffset.inHours}:${timeOfDay.minute - timezoneOffset.inMinutes % 60}";
}

@freezed
class GroupSessionModel with _$GroupSessionModel {
  factory GroupSessionModel(
      {int? id,
      required int weekday,
      @JsonKey(name: "start_time", fromJson: timeFromJson, toJson: timeToJson)
      required TimeOfDay startTime,
      @JsonKey(name: "end_time", fromJson: timeFromJson, toJson: timeToJson)
      required TimeOfDay endTime}) = _GroupSessionModel;

  factory GroupSessionModel.fromJson(Map<String, dynamic> json) =>
      _$GroupSessionModelFromJson(json);
}
