import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final positionProvider = FutureProvider.autoDispose<LocationData>((ref) async {
  Location location = Location.instance;
  await location.changeSettings(accuracy: LocationAccuracy.balanced);

  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      throw "You seem to not have enabled location services on your device. Please enable them.";
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      throw "Please give this application permission to use your location.";
    }
  }

  return await location.getLocation();
});
