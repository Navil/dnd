import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'group_address.freezed.dart';
part 'group_address.g.dart';

@freezed
class GroupAddressModel with _$GroupAddressModel {
  factory GroupAddressModel(
      {int? id,
      @JsonKey(toJson: locationToJson, fromJson: locationFromJson)
      required LatLng location,
      required String address}) = _GroupAddressModel;

  factory GroupAddressModel.fromJson(Map<String, dynamic> json) =>
      _$GroupAddressModelFromJson(json);
}

String locationToJson(LatLng location) {
  return 'POINT(${location.longitude} ${location.latitude})';
}

LatLng locationFromJson(String hexString) {
  Uint8List bytes = Uint8List(hexString.length ~/ 2);
  for (int i = 0; i < hexString.length; i += 2) {
    bytes[i ~/ 2] = int.parse(hexString.substring(i, i + 2), radix: 16);
  }

  // Create ByteData from byte array
  final byteData = ByteData.sublistView(bytes);

  Endian endian = Endian.little;

  double longitude = byteData.getFloat64(9, endian);
  double latitude = byteData.getFloat64(9 + 8, endian);

  return LatLng(latitude, longitude);
}
