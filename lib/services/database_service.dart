import 'package:dnd/model/player.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  Future<void> savePlayer(Player player) async {
    player.id = uid;
    try {
      await Supabase.instance.client.from("players").upsert(player.toJson());
    } catch (err) {
      print(err);
    }
  }

  Future<Player?> loadPlayer(String uid) async {
    final response = await Supabase.instance.client
        .from('players')
        .select()
        .eq('id', uid)
        .single();

    return Player.fromJson(response);
  }
}
