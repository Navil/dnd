import 'package:dnd/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class MessageModel with _$MessageModel {
  factory MessageModel(
      {@JsonKey(includeIfNull: false) int? id,
      @JsonKey(
        name: "created_at",
        includeToJson: false,
      )
      required DateTime createdAt,
      @JsonKey(name: "users") required UserModel sender,
      required String message}) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
