import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {required String id,
      required String firstname,
      @JsonKey(includeToJson: false) required DateTime createdAt}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
