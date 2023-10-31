
class Group {
  int? id;
  DateTime? createdAt;

  final bool isRemote;
  String description;
  String title;
  String ownerId;


  Group(
      {required this.id,
      required this.isRemote,
      required this.title,
      required this.createdAt,
      required this.description,
      required this.ownerId});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
        id: json['id'],
        isRemote: json['is_remote'] == "true",
        createdAt: DateTime.parse(json['created_at']),
        ownerId: json["owner_id"],
        title: json["title"],
        description: json["description"]);
  }

  dynamic toDatabaseJson() {
    return {
      if (id != null) ...{"id": id},
      "is_remote": isRemote,
      "description": description,
      "title": title
    };
  }
}
