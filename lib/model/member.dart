import 'package:dnd/model/group.dart';
import 'package:dnd/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class MemberModel with _$MemberModel {
  factory MemberModel(
          {@JsonKey(name: "group_id") required int groupId,
          @JsonKey(name: "user_id") required String userId,
          @JsonKey(name: "is_dm") required bool isDm,
          @JsonKey(includeToJson: false, name: "created_at")
          required DateTime createdAt,
          @JsonKey(includeToJson: false, name: "users") UserModel? user,
          @JsonKey(includeToJson: false, name: "groups") GroupModel? group}) =
      _MemberModel;

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
}
