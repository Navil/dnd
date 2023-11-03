
import 'package:dnd/pages/edit_group.dart';
import 'package:dnd/pages/edit_profile.dart';
import 'package:dnd/pages/tabs.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router.g.dart';

const loginPath = "/login";
const homePath = "/";
const _editProfilePath = "edit_profile";
const _editGroupPath = "edit_group";
const editProfilePath = "/$_editProfilePath";
const editGroupPath = "/$_editGroupPath";


final _key = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: loginPath,
        builder: (context, state) => ElevatedButton(
              onPressed: () async {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  await ref.read(authServiceProvider).loginGoogle();
                });
            },
            child: const Text("Login")),
      ),
      
      GoRoute(
            path: homePath,
            builder: (context, state) => const TabsPage(),
          routes: [
            GoRoute(
                path: _editProfilePath,
              builder: (context, state) => const EditProfilePage(),
              ),
              GoRoute(
                  path: _editGroupPath,
                  builder: (context, state) {
                    String? id = state.uri.queryParameters["id"];
                    return EditGroupPage(id == null ? null : int.parse(id));
                  }
                  
              ),
          ]),
    ],
      redirect: (context, state) => _redirectLogic(ref, state));
}

FutureOr<String?> _redirectLogic(AutoDisposeRef ref, GoRouterState state) {
  final authState = ref.watch(authUserProvider);
  final isLoggedIn =
      authState.maybeWhen(data: (user) => user != null, orElse: () => false);
  final isLoggingIn =
      authState.maybeWhen(loading: () => true, orElse: () => false);

  if (!isLoggedIn && !isLoggingIn && state.path != loginPath) {
    return loginPath;
  }

  if (isLoggedIn) {
    final hasUserProfile = ref.watch(hasUserProfileProvider);
    if (!hasUserProfile &&
        state.path != _editProfilePath) {
      return homePath + _editProfilePath;
    }
  } else if (state.path != loginPath) {
    return loginPath;
  }

  return null;
}
