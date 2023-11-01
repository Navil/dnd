import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:dnd/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FindGroupTab extends ConsumerStatefulWidget {
  const FindGroupTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FindGroupTabState();
}

class _FindGroupTabState extends ConsumerState<FindGroupTab>
    with AutomaticKeepAliveClientMixin<FindGroupTab> {
      
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final location = ref.watch(locationProvider);
    final nearbyGroups = ref.watch(nearbyGroupsProvider);
    
    return switch (location) {
      AsyncData(:final value) => Stack(
          children: [
            if (nearbyGroups.value?.isNotEmpty == true)
              ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(nearbyGroups.value![index].group.title),
                  trailing: Text((nearbyGroups.value![index].distanceInMeters)
                          .toInt()
                          .toString() +
                      " meters"),
                ),
                itemCount: nearbyGroups.value!.length,
              ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () async {
                  ref.invalidate(locationProvider);
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
  
  @override
  bool get wantKeepAlive => true;
}
