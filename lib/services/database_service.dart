import 'package:dnd/model/player.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final String uid;
  final playerDatabase = Supabase.instance.client.from("players");

  DatabaseService(this.uid);

  Future<void> savePlayer(Player player) async {
    player.id = uid;
    try {
      await playerDatabase.upsert(player.toJson());
    } catch (err) {
      print(err);
    }
  }

  Future<Player?> loadPlayer(String uid) async {
    try {
      final response = await playerDatabase
        .select()
        .eq('id', uid)
        .single();

    return Player.fromJson(response);
    } catch (err) {
      print(err);
    }
    return null;
  }
}
