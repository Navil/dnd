import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class GroupModel with _$GroupModel {
  factory GroupModel(
      {int? id,
      @JsonKey(name: "is_remote") required bool isRemote,
      required String title,
      @JsonKey(includeToJson: false) required DateTime createdAt,
      required String description,
      @JsonKey(name: "owner_id") required String ownerId}) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
