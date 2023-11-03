import 'package:dnd/model/group.dart';
import 'package:dnd/model/user.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final String uid;
  final Ref ref;
  final userDatabase = Supabase.instance.client.from("users");
  final groupDatabase = Supabase.instance.client.from("groups");
  final memberDatabase = Supabase.instance.client.from("members");
  final groupsOfUserView = Supabase.instance.client.from("groups_of_user");
  final groupAddressesDatabase =
      Supabase.instance.client.from("group_addresses");

  final membershipListener = Supabase.instance.client.channel('memberships');

  DatabaseService(this.ref, this.uid);

  Future<void> saveUser(UserModel user) async {
    await userDatabase.upsert(user.toJson());
    ref.invalidate(userProfileProvider(uid));
  }

  Future<UserModel?> loadUser(String uid) async {
    final response = await userDatabase.select().eq('id', uid).single();
    if (response == null) {
      return null;
    }
    return UserModel.fromJson(response);
  }

  Future<GroupModel?> loadGroup(int id) async {
    final response = await groupDatabase
        .select("*, group_addresses(*)")
        .eq('id', id)
        .single();
    if (response == null) {
      return null;
    }

    GroupModel model = GroupModel.fromJson(response);
    return model;
  }

  Future<void> saveGroup(GroupModel group) async {
    Map<String, dynamic> response =
        await groupDatabase.upsert(group.toJson()).select("id").single();
    final groupId = response.values.first;

    //New group, so add self as member
    if (group.id == null) {
      await memberDatabase.upsert({"group_id": groupId, "user_id": uid});
    }

    //Group has an address, so
    if (!group.isRemote) {
      await groupAddressesDatabase
          .upsert(group.address!.copyWith(id: groupId).toJson());
    } else if (group.address != null) {
      //If the group switched to remote
      await groupAddressesDatabase.delete().eq("id", groupId);
    }
    ref.invalidate(getGroupsOfUserProvider);
  }

  Future<void> addMember(GroupModel group, String userId) async {
    await groupDatabase.upsert(group.toJson());
  }

  Future<List<GroupModel>> getGroupsOfUser() async {
    try {
      final groups =
          await groupsOfUserView.select<List<dynamic>>("*").eq("id", uid);
      print(groups);

      return groups.map((groupData) {
        return GroupModel.fromJson(
            {...groupData["groups"], "users": groupData["users"]});
      }).toList();
    } catch (errir) {
      print(errir);
      rethrow;
    }
  }
}
