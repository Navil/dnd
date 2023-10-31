import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/services/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'supabase_provider.g.dart';

@riverpod
DatabaseService database(AutoDisposeRef ref) {
  final user = ref.watch(loggedInUserProvider);
  return DatabaseService(user.id);
}
