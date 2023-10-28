class Player {
  late int id;
  late DateTime createdAt;
  late String firstname;

  Player({required this.id, required this.firstname, required this.createdAt});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      firstname: json['firstname'],
      createdAt: json['createdAt'],
    );
  }
}
