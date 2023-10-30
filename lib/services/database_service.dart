import 'package:dnd/model/group.dart';
import 'package:dnd/model/player.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final String uid;
  final playerDatabase = Supabase.instance.client.from("players");
  final groupDatabase = Supabase.instance.client.from("groups");

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
      final response = await playerDatabase.select().eq('id', uid).single();

      return Player.fromJson(response);
    } catch (err) {
      print(err);
    }
    return null;
  }

  Future<Group?> loadGroup(int id) async {
    try {
      final response = await groupDatabase.select().eq('id', id).single();

      return Group.fromJson(response);
    } catch (err) {
      print(err);
    }
    return null;
  }

  Future<void> saveGroup(Group group) async {
    try {
      await groupDatabase.upsert(group.toJson());
    } catch (err) {
      print(err);
    }
  }
}
