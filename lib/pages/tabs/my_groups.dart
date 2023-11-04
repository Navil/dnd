import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/model/group.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:dnd/router.dart';
import 'package:dnd/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MyGroupsTab extends ConsumerStatefulWidget {
  const MyGroupsTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyGroupsTabState();
}

class _MyGroupsTabState extends ConsumerState<MyGroupsTab>
    with AutomaticKeepAliveClientMixin<MyGroupsTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ref.watch(getGroupsOfUserProvider).when(
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const AdaptiveLoadingIndicator(),
        data: (data) {
          final groups = data;

          return RefreshIndicator(
            onRefresh: () => ref.refresh(getGroupsOfUserProvider.future),
            child: Stack(
              children: [
                groups.isEmpty
                    ? const Center(
                        child: Text("You are currently not part of any group."),
                      )
                    :
                ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    GroupModel group = groups[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () => context
                                        .go("$editGroupPath?id=${group.id}"),
                                    title: Text(group.title),
                                    subtitle: Text(
                                      group.description,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    trailing: FaIcon(group.isRemote
                                        ? FontAwesomeIcons.globe
                                        : FontAwesomeIcons.locationDot),
                                  ),
                                  if (group.members?.isNotEmpty == true)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: group.members!
                                              .map((member) => Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8.0),
                                                    child: UserAvatar(
                                                        url: member
                                                            .user?.pictureUrl),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                          );
                  },
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: FloatingActionButton(
                      heroTag: "my-groups",
                      child: const FaIcon(FontAwesomeIcons.plus),
                      onPressed: () => context.go("/edit_group")),
                )
              ],
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
