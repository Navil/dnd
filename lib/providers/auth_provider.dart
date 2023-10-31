import 'dart:ffi';

import 'package:dnd/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;
import 'dart:async';
import 'package:async/async.dart';
part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<User?> authUser(Ref ref) {
  // Get the current user session
  final currentUser = Supabase.instance.client.auth.currentUser;

  // Create a stream that listens to auth state changes
  final authStateChanges =
      Supabase.instance.client.auth.onAuthStateChange.map((event) {
    return event.session?.user;
  });

  // If there's a current user, start the stream with that user
  // Otherwise, listen for auth state changes
  return currentUser != null
      ? StreamGroup.merge([Stream.value(currentUser), authStateChanges])
      : authStateChanges;
}

@riverpod
User loggedInUser(AutoDisposeRef ref) {
  final user = ref.watch(authUserProvider).value;
  if (user == null) {
    throw "loggedInUser used but user is not logged in.";
  }
  return user;
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
