class Player {
  late String id;
  late DateTime createdAt;
  late String firstname;

  Player({required this.id, required this.firstname, required this.createdAt});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      firstname: json['firstname'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  factory Player.empty() {
    return Player(id: "", createdAt: DateTime.now(), firstname: "");
  }

  dynamic toJson() {
    return {"id": id, "firstname": firstname};
  }
}
