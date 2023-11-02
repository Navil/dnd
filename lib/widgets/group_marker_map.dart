import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupMarkerMap extends StatelessWidget {
  final LatLng location;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  GroupMarkerMap({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
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
            markerId: MarkerId(location.toString()),
            position: location,
            onTap: navigate)
      },
    );
  }

  void navigate() async {
    double lat = location.latitude;
    double lng = location.longitude;

    String googleUrl = 'comgooglemaps://?center=$lat,$lng';
    String appleUrl = 'https://maps.apple.com/?sll=$lat,$lng';
    if (await canLaunchUrl(Uri.parse("comgooglemaps://"))) {
      await launchUrl(Uri.parse(googleUrl));
    } else if (await canLaunchUrl(Uri.parse(appleUrl))) {
      await launchUrl(Uri.parse(appleUrl));
    } else {
      throw 'Could not launch url';
    }
  }
}
