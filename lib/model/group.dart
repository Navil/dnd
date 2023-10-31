
class Group {
  int? id;
  final bool isRemote;
  String description;
  DateTime? createdAt;
  String ownerId;


  Group(
      {required this.id,
      required this.isRemote,
      required this.createdAt,
      required this.description,
      required this.ownerId});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
        id: json['id'],
        isRemote: json['is_remote'] == "true",
        createdAt: DateTime.parse(json['created_at']),
        ownerId: json["owner_id"],
        description: json["description"]);
  }

  dynamic toDatabaseJson() {
    return {
      if (id != null) ...{"id": id},
      "is_remote": isRemote,
      "description": description
    };
  }
}
