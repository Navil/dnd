import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class GroupMarkerMap extends StatelessWidget {
  final LatLng location;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  GroupMarkerMap({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: false,
      rotateGesturesEnabled: false,
      tiltGesturesEnabled: false,
      scrollGesturesEnabled: false,
      initialCameraPosition: CameraPosition(target: location, zoom: 15),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        Marker(
            infoWindow: InfoWindow(
                title: "Open Maps",
                onTap: navigate,
                snippet: "Click to Navigate"),
            markerId: MarkerId(location.toString()),
            position: location)
      },
    );
  }

  Future<bool> navigate() async {
    double lat = location.latitude;
    double lng = location.longitude;

    return await MapsLauncher.launchCoordinates(lat, lng);
  }
}
