import 'package:dnd/pages/edit_profile.dart';
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
  final hasUserProfile = ref.watch(userProfileProvider
      .select((value) => !value.isLoading && value.asData?.value != null));

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
          routes: [
            GoRoute(
              path: 'edit_profile',
              builder: (context, state) => const EditProfilePage(),
            ),
          ]),
    ],
    redirect: (context, state) {
      print("Redirect");
      print(state.uri);
      final isLoggedIn = user != null;
      print(isLoggedIn);
      print(hasUserProfile);
      if (isLoggedIn && !hasUserProfile) {
        return "/edit_profile";
      }

      final isLoggingIn = state.uri.toString() == loginPath;

      if (isLoggingIn) return isLoggedIn ? "/" : null;

      return isLoggedIn ? null : loginPath;
    },
  );
});
