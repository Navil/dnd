import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:dnd/widgets/group_distance.dart';
import 'package:dnd/widgets/member_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FindGroupList extends ConsumerWidget {
  const FindGroupList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nearbyGroups = ref.watch(findGroupsProvider);
    return switch (nearbyGroups) {
      AsyncData() => nearbyGroups.value.isEmpty
          ? const Center(child: Text("No groups found"))
          : ListView.builder(
              itemBuilder: (context, index) {
                final result = nearbyGroups.value[index];
                return ListTile(
                  title: Text(result.group.title),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MemberCount(
                          number: result.numMembers,
                          memberType: MemberType.member),
                      Row(
                        children: [
                          MemberCount(
                              number: result.numDungeonMasters,
                              memberType: MemberType.dm),
                          MemberCount(
                              number: result.numPlayers,
                              memberType: MemberType.player),
                        ],
                      ),
                    ],
                  ),
                  trailing: result.group.isRemote
                      ? null
                      : GroupDistance((result.distanceInMeters!)),
                  leading: IconButton(
                      onPressed: () => {
                            ref
                                .read(databaseServiceProvider)
                                .createChat(result.group.id!)
                          },
                      icon: const FaIcon(FontAwesomeIcons.message)),
                );
              },
              itemCount: nearbyGroups.value.length,
            ),
      AsyncError(:final error) => Text('$error'),
      _ => const AdaptiveLoadingIndicator(),
    };
  }
}
