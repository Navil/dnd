import 'package:dnd/model/group.dart';
import 'package:dnd/model/group_address.dart';
import 'package:dnd/model/player.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final String uid;
  final playerDatabase = Supabase.instance.client.from("players");
  final groupDatabase = Supabase.instance.client.from("groups");
  final memberDatabase = Supabase.instance.client.from("members");
  final groupAddressesDatabase =
      Supabase.instance.client.from("group_addresses");

  DatabaseService(this.uid);

  Future<void> savePlayer(Player player) async {
    player.id = uid;
    try {
      await playerDatabase.upsert(player.toDatabaseJson());
    } catch (err) {
      print(err);
    }
  }

  Future<Player?> loadPlayer(String uid) async {
    final response = await playerDatabase.select().eq('id', uid).single();
    if (response == null) {
      return null;
    }

    return Player.fromJson(response);
  }

  Future<Group?> loadGroup(int id) async {
    final response = await groupDatabase.select().eq('id', id).single();
    if (response == null) {
      return null;
    }
    return Group.fromJson(response);
  }

  Future<void> saveGroup(Group group, GroupAddress? address) async {
    final response =
        await groupDatabase.upsert(group.toDatabaseJson()).select("id");
    final groupId = response[0]["id"];
    if (group.id == null) {
      await addPlayerToGroup(groupId, uid);
    }
    if (address != null) {
      await groupAddressesDatabase.upsert(address.toDatabaseJson(groupId));
    }
  }

  Future<void> addPlayerToGroup(int groupId, String uid) async {
    await memberDatabase.upsert({"group_id": groupId, "user_id": uid});
  }

  Future<void> addMember(Group group, String userId) async {
    await groupDatabase.upsert(group.toDatabaseJson());
  }

  Future<List<Group>> getGroupsOfPlayer() async {
    final groups =
        await memberDatabase.select<List<dynamic>>("group_id, groups(*)");
    print(groups);
    return groups.map((groupData) {
      print(groupData);
      return Group.fromJson(groupData["groups"]);
    }).toList();
  }
}
