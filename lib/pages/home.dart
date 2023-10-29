import 'package:dnd/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.go("/edit_profile"),
            icon: const FaIcon(FontAwesomeIcons.person)),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                ref.read(authServiceProvider).logout();
              },
              child: const Text("Logout"))
        ],
      ),
    );
  }
}
