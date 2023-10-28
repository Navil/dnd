import 'package:dnd/providers/user_profile_provider.dart';
import 'package:dnd/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const loginPath = "/login";
const splashPath = "/splash";

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final user = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: loginPath,
        builder: (context, state) => ElevatedButton(
            onPressed: () {
              ref.read(authProvider.notifier).loginGoogle();
            },
            child: const Text("Login")),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => ElevatedButton(
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
            child: const Text("Logout")),
      ),
      GoRoute(
        path: '/edit_profile',
        builder: (context, state) => const Text("Edit Profile"),
      ),
    ],
    redirect: (context, state) async {
      print("Reditrect");
      bool playerExists = ref.read(userProfileProvider).hasValue;

      final isLoggedIn = user != null;

      final isLoggingIn = state.uri.toString() == loginPath;
      if (isLoggingIn) return isLoggedIn ? "/" : null;

      if (isLoggingIn && !playerExists) {
        return "/edit_profile";
      }

      return isLoggedIn ? null : loginPath;
    },
  );
});
