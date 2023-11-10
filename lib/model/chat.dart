import 'package:dnd/model/group.dart';
import 'package:dnd/model/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class ChatModel with _$ChatModel {
  factory ChatModel(
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(
        name: "created_at",
        includeToJson: false,
      )
      required DateTime createdAt,
      @JsonKey(includeToJson: false, name: "groups") required GroupModel group,
      @JsonKey(includeToJson: false)
      List<MessageModel>? messages}) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
