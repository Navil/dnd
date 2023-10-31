import 'package:dnd/model/player.dart';
import 'package:dnd/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'player_profile.g.dart';

@riverpod
Future<Player?> playerProfile(AutoDisposeRef ref, String uid) {
  return ref.watch(databaseProvider).loadPlayer(uid);
}
