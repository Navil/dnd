import 'package:dnd/adaptive/loading_indicator.dart';
import 'package:dnd/model/message.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerStatefulWidget {
  final int chatId;
  const ChatPage(this.chatId, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget>? appBarActions;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        actions: appBarActions,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: ref.watch(chatMessageNotifierProvider(widget.chatId)).when(
              loading: () => const AdaptiveLoadingIndicator(),
              error: (error, stackTrace) => Text(error.toString()),
              data: _showChatMessages)),
    );
  }

  Widget _showChatMessages(List<MessageModel> messages) {
    if (messages.isEmpty) {
      return const Center(
        child: Text("No messages yet."),
      );
    }
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        MessageModel message = messages[index];

        return Text(message.message);
      },
    );
  }
}
