import 'package:dnd/pages/chat.dart';
import 'package:dnd/pages/edit_group.dart';
import 'package:dnd/pages/edit_profile.dart';
import 'package:dnd/pages/login.dart';
import 'package:dnd/pages/tabs.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

const loginPath = "/login";
const homePath = "/";
const _editProfilePath = "edit_profile";
const _editGroupPath = "edit_group";
const _chatPath = "chat";
const editProfilePath = "/$_editProfilePath";
const editGroupPath = "/$_editGroupPath";
const chatPath = "/$_chatPath";

final _key = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authUserProvider);
  final isLoggedIn =
      authState.maybeWhen(data: (user) => user != null, orElse: () => false);
  final isLoggingIn =
      authState.maybeWhen(loading: () => true, orElse: () => false);
  return GoRouter(
      navigatorKey: _key,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: loginPath,
          builder: (context, state) => const LoginPage(),
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
                },
              ),
              GoRoute(
                  path: _chatPath,
                  builder: (context, state) {
                    String? id = state.uri.queryParameters["id"];
                    if (id == null) {
                      throw "Navigated without chatId";
                    }
                    return ChatPage(int.parse(id));
                  }),
            ]),
      ],
      redirect: (context, state) {
        if (!isLoggedIn && !isLoggingIn && state.path != loginPath) {
          return loginPath;
        }

        if (isLoggedIn) {
          final hasUserProfile = ref.watch(hasUserProfileProvider);
          if (!hasUserProfile && state.path != _editProfilePath) {
            return homePath + _editProfilePath;
          }
        } else if (state.path != loginPath) {
          return loginPath;
        }

        return null;
      });
}
