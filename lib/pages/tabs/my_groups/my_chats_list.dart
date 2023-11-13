import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/model/chat.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:dnd/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MyChatsList extends ConsumerWidget {
  const MyChatsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getChatRequestsOfUserProvider).when(
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const AdaptiveLoadingIndicator(),
        data: (data) {
          final chats = data;

          return chats.isEmpty
              ? const Center(
                  child: Text("You have no active chat requests."),
                )
              : ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    ChatModel chat = chats[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () =>
                                  context.go("$chatPath?id=${chat.id}"),
                              title: Text(chat.group.title),
                              subtitle: (chat.messages?.length ?? 0) > 0
                                  ? Text(chat.messages!.first.message)
                                  : null,
                              trailing: FaIcon(chat.group.isRemote
                                  ? FontAwesomeIcons.globe
                                  : FontAwesomeIcons.locationDot),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        });
  }
}
