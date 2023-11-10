import 'package:dnd/model/chat.dart';
import 'package:dnd/model/group_address.dart';
import 'package:dnd/model/member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';
part 'group.g.dart';


@freezed
class GroupModel with _$GroupModel {
  factory GroupModel(
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(name: "is_remote") required bool isRemote,
      required String title,
      @JsonKey(includeToJson: false, name: "created_at")
      required DateTime createdAt,
      required String description,
      @JsonKey(name: "owner_id") required String ownerId,
      @JsonKey(name: "group_addresses", includeToJson: false)
      GroupAddressModel? address,
      @JsonKey(includeToJson: false) ChatModel? chat,
      @JsonKey(includeToJson: false) List<MemberModel>? members}) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
