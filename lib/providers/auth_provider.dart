import 'package:dnd/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;
import 'dart:async';
part 'auth_provider.g.dart';


@Riverpod(keepAlive: true)
Stream<User?> authUser(AuthUserRef ref) {
  return Supabase.instance.client.auth.onAuthStateChange.map((event) {
    print("authUser");
    return event.session?.user;
  });
}


@Riverpod(keepAlive: true)
User loggedInUser(LoggedInUserRef ref) {
  final user = ref.watch(authUserProvider).value;
  print("loggedInUser");
  if (user == null) {
    throw "loggedInUser used but user is not logged in.";
  }
  return user;
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService();
}
