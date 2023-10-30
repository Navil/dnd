import 'package:latlong2/latlong.dart';

const int idForNoGroup = -1;

class Group {
  late int id;
  late LatLng location;
  late bool isRemote;
  late String description;
  late DateTime createdAt;

  Group(
      {required this.id,
      required this.isRemote,
      required this.createdAt,
      required this.location,
      required this.description});

  factory Group.fromJson(Map<String, dynamic> json) {
    print(json);
    return Group(
        id: json['id'],
        isRemote: json['is_remote'] == "true",
        createdAt: DateTime.parse(json['created_at']),
        description: json["description"],
        location: json["location"]);
  }

  factory Group.empty() {
    return Group(
        id: idForNoGroup,
        isRemote: false,
        location: const LatLng(0, 0),
        createdAt: DateTime.now(),
        description: "");
  }

  dynamic toJson() {
    return {
      if (id != idForNoGroup) ...{"id": id},
      "isRemote": isRemote,
      "description": description,
      'location': 'POINT(${location.latitude} ${location.longitude})'
    };
  }
}
