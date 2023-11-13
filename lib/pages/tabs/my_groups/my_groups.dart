import 'package:dnd/providers/database_provider.dart';
import 'package:dnd/pages/tabs/my_groups/my_chats_list.dart';
import 'package:dnd/pages/tabs/my_groups/my_groups_list.dart';
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

    return RefreshIndicator(
      onRefresh: () {
        ref.invalidate(getGroupsOfUserProvider);
        ref.invalidate(getChatRequestsOfUserProvider);
        return Future(() => null);
      },
      child: Stack(
        children: [
          const Column(
            children: [
              Flexible(child: MyChatsList()),
              Flexible(child: MyGroupsList()),
            ],
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
  }

  @override
  bool get wantKeepAlive => true;
}
