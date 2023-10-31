import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

class FindGroupTab extends ConsumerStatefulWidget {
  const FindGroupTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FindGroupTabState();
}

class _FindGroupTabState extends ConsumerState<FindGroupTab> {
  final _mapController = MapController();
  @override
  Widget build(BuildContext context) {
    final location = ref.watch(locationProvider);
    return switch (location) {
      AsyncData(:final value) => Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                  keepAlive: true,
                  initialCenter: LatLng(value.latitude, value.longitude)),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'at.valley.dnd',
                ),
              
              ],
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () async {
                  ref.refresh(locationProvider).value;
                  final newLocation = await ref.read(locationProvider.future);
                  _mapController.move(
                      LatLng(newLocation.latitude, newLocation.longitude),
                      _mapController.camera.zoom);
                },
                child: const FaIcon(FontAwesomeIcons.locationCrosshairs),
              ),
            ),
          ],
        ),
      AsyncError(:final error) => Text('$error'),
      _ => const AdaptiveLoadingIndicator(),
    };
  }
}
