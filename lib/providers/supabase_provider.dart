import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/services/supabase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final supabaseProvider = Provider<SupabaseService>((ref) {
  final user = ref.watch(authStateProvider).asData?.value;
  return SupabaseService(user!.id);
});
