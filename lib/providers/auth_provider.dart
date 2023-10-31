import 'package:dnd/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;
import 'dart:async';
import 'package:async/async.dart';

final authUserProvider = StreamProvider<User?>((ref) {
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
});

final loggedInUserProvider = Provider<User>((ref) {
  return ref.watch(authUserProvider).value!;
});

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
