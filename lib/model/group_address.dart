import 'package:latlong2/latlong.dart';

class GroupAddress {
  int? id;
  LatLng location;
  String address;

  GroupAddress({this.id, required this.location, required this.address});

  dynamic toDatabaseJson(int? existingId) {
    final addressId = existingId ?? id;
    if (addressId == null) {
      throw "Provide an Id to save a GroupAddress.";
    }

    return {
      "id": addressId,
      "address": address,
      'location': 'POINT(${location.longitude} ${location.latitude})'
    };
  }
}
