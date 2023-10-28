import 'package:dnd/model/player.dart';
import 'package:dnd/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerDetailsProvider =
    FutureProvider.family<Player?, String>((ref, uid) {
  return ref.watch(supabaseProvider).loadPlayer(uid);
});
