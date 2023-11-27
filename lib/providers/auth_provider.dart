import 'dart:async';

import 'package:dnd/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<User?> authUser(AuthUserRef ref) {
  return Supabase.instance.client.auth.onAuthStateChange.map((event) {
    debugPrint(event.event.toString());
    return event.session?.user;
  });
}

@riverpod
User loggedInUser(LoggedInUserRef ref) {
  final user = ref.watch(authUserProvider).value;
  if (user == null) {
    throw "loggedInUser used but user is not logged in.";
  }
  return user;
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService();
}
