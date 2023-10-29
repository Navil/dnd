import 'dart:async';

import 'package:dnd/pages/edit_profile.dart';
import 'package:dnd/pages/home.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const loginPath = "/login";
const homePath = "/";
const editProfilePath = "edit_profile";

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: loginPath,
        builder: (context, state) => ElevatedButton(
            onPressed: () {
                ref.read(authServiceProvider).loginGoogle();
            },
            child: const Text("Login")),
      ),
      
      GoRoute(
            path: homePath,
            builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
                path: editProfilePath,
              builder: (context, state) => const EditProfilePage(),
            ),
          ]),
    ],
      redirect: (context, state) => _redirectLogic(ref, state));
});
FutureOr<String?> _redirectLogic(ProviderRef ref, GoRouterState state) {
  final authState = ref.watch(authUserProvider);
  final isLoggedIn =
      authState.maybeWhen(data: (user) => user != null, orElse: () => false);
  final isLoggingIn =
      authState.maybeWhen(loading: () => true, orElse: () => false);

  if (!isLoggedIn && !isLoggingIn && state.path != loginPath) {
    return loginPath;
  }

  if (isLoggedIn) {
    final userId = authState.value!.id;
    final userProfileState = ref.watch(playerDetailsProvider(userId));
    final hasUserProfile = userProfileState.maybeWhen(
        data: (details) => details != null, orElse: () => false);
    final isUserProfileLoading =
        userProfileState.maybeWhen(orElse: () => false, loading: () => true);

    if (!hasUserProfile &&
        state.path != editProfilePath &&
        !isUserProfileLoading) {
      print(editProfilePath);
      return homePath + editProfilePath;
    }
  }

  return null;
}
