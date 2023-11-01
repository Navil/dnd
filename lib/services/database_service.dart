import 'package:dnd/model/group.dart';
import 'package:dnd/model/group_address.dart';
import 'package:dnd/model/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final String uid;
  final userDatabase = Supabase.instance.client.from("users");
  final groupDatabase = Supabase.instance.client.from("groups");
  final memberDatabase = Supabase.instance.client.from("members");
  final groupAddressesDatabase =
      Supabase.instance.client.from("group_addresses");

  final membershipListener = Supabase.instance.client.channel('memberships');

  DatabaseService(this.uid);

  Future<void> saveUser(UserModel user) async {
    try {
      await userDatabase.upsert(user.toJson());
    } catch (err) {
      print(err);
    }
  }

  Future<UserModel?> loadUser(String uid) async {
    final response = await userDatabase.select().eq('id', uid).single();
    if (response == null) {
      return null;
    }

    return UserModel.fromJson(response);
  }

  Future<GroupModel?> loadGroup(int id) async {
    final response = await groupDatabase.select().eq('id', id).single();
    if (response == null) {
      return null;
    }
    return GroupModel.fromJson(response);
  }

  Future<void> saveGroup(GroupModel group, GroupAddress? address) async {
    final response =
        await groupDatabase.upsert(group.toJson()).select("id");
    final groupId = response[0]["id"];
    if (group.id == null) {
      await addUserToGroup(groupId, uid);
    }
    if (address != null) {
      await groupAddressesDatabase.upsert(address.toDatabaseJson(groupId));
    }
  }

  Future<void> addUserToGroup(int groupId, String uid) async {
    await memberDatabase.upsert({"group_id": groupId, "user_id": uid});
  }

  Future<void> addMember(GroupModel group, String userId) async {
    await groupDatabase.upsert(group.toJson());
  }

  Future<List<GroupModel>> getGroupsOfUser() async {
    final groups =
        await memberDatabase.select<List<dynamic>>("group_id, groups(*)");
    return groups.map((groupData) {
      return GroupModel.fromJson(groupData["groups"]);
    }).toList();
  }
}
