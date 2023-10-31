import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/services/database_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final supabaseProvider = Provider<DatabaseService>((ref) {
  final user = ref.watch(loggedInUserProvider);
  return DatabaseService(user.id);
});
