import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {required String id,
      required String firstname,
      @JsonKey(name: "picture_url") String? pictureUrl,
      @JsonKey(name: "experience_level")
      required ExperienceLevel experienceLevel,
      @JsonKey(name: "last_online") required DateTime lastOnline,
      @JsonKey(name: "timezone_offset") required int timezoneOffset,
      @JsonKey(includeToJson: false, name: "created_at")
      required DateTime createdAt}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}


ExperienceLevel experienceLevelFromJson(dynamic jsonValue) {
  return ExperienceLevel.values
      .firstWhere((element) => element.name == jsonValue);
}

enum ExperienceLevel { beginner, intermediate, experienced, veteran }
