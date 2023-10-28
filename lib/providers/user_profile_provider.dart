import 'package:dnd/model/player.dart';
import 'package:dnd/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final userProfileProvider = FutureProvider.autoDispose<Player?>((ref) async {
  final user = ref.watch(authProvider);

  if (user == null) {
    return null; // No user signed in
  }
  print("Loading player");
  final response = await Supabase.instance.client
      .from('profiles')
      .select()
      .eq('id', user.id)
      .single();

  if (response.error != null) {
    throw response.error!;
  }
  print("Returning player");

  return Player.fromJson(response.data);
});
