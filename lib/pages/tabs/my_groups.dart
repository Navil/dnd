import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/model/group.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/supabase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyGroupsTab extends ConsumerStatefulWidget {
  const MyGroupsTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyGroupsTabState();
}

class _MyGroupsTabState extends ConsumerState<MyGroupsTab> {
  final membershipListener = Supabase.instance.client.channel('memberships');
  @override
  void initState() {
    super.initState();
    final userId = ref.read(loggedInUserProvider).id;
    membershipListener.on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(
          event: 'INSERT',
          schema: 'public',
          table: 'members',
          filter: 'user_id=eq.' + userId,
        ), (payload, [ref]) {
      print("New Event");
      // Do something fun or interesting when there is an change on the database
    }).subscribe();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Group>>(
        future: ref.watch(supabaseProvider).getGroupsOfPlayer(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return AdaptiveLoadingIndicator();
          }

          final groups = snapshot.data;
          print(groups);
          return Stack(
            children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  return Text(groups![index].description);
                },
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                    child: const FaIcon(FontAwesomeIcons.plus),
                    onPressed: () => context.go("/edit_group")),
              )
            ],
          );
        });
  }
}
