import 'package:dnd/model/chat.dart';
import 'package:dnd/model/group.dart';
import 'package:dnd/model/message.dart';
import 'package:dnd/model/user.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:dnd/utils/datetime_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final String uid;
  final Ref ref;
  final userDatabase = Supabase.instance.client.from("users");
  final groupDatabase = Supabase.instance.client.from("groups");
  final memberDatabase = Supabase.instance.client.from("members");
  final chatDatabase = Supabase.instance.client.from("chats");
  final messagesDatabase = Supabase.instance.client.from("messages");

  final groupAddressesDatabase =
      Supabase.instance.client.from("group_addresses");

  DatabaseService(this.ref, this.uid);

  Future<void> saveUser(UserModel user) async {
    await userDatabase.upsert(user);
    ref.invalidate(userProfileProvider(uid));
  }

  Future<void> removeMembersFromGroup(List<String> members, int groupId) async {
    await memberDatabase
        .delete()
        .eq("group_id", groupId)
        .in_("user_id", members);
  }

  updateLastOnline() async {
    UserModel? userModel = await ref.read(userProfileProvider(uid).future);
    if (userModel != null) {
      DateTime now = DateTime.timestamp();
      await saveUser(userModel.copyWith(
          lastOnline: now, timezoneOffset: DateTimeUtils.getTimezoneOffset()));
    }
  }

  Future<UserModel?> loadUser(String uid) async {
    try {
      final response = await userDatabase.select().eq('id', uid).maybeSingle();
    
      if (response == null) {
        return null;
      }
      return UserModel.fromJson(response);
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<GroupModel?> loadGroup(int id) async {
    final response = await groupDatabase
        .select("*, group_addresses(*),members(*,users(*))")
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

  Future<void> createChat(int groupId) async {
    await chatDatabase.insert({"group_id": groupId, "user_id": uid});
  }

  Future<List<GroupModel>> getGroupsOfUser() async {
    final memberResponse = await memberDatabase
        .select<List<Map<String, dynamic>>>('groups(*, members(*, users(*)))')
        .eq('user_id', uid);

    return memberResponse.map((group) {
      return GroupModel.fromJson(group["groups"]);
    }).toList();
  }

  Future<List<ChatModel>> getChatRequestsOfUser() async {
    final chatResponse = await chatDatabase
        .select<List<Map<String, dynamic>>>('*,groups(*)')
        .eq('user_id', uid);

    List<ChatModel> chats =
        chatResponse.map((chat) => ChatModel.fromJson(chat)).toList();

    for (var i = 0; i < chats.length; i++) {
      final newestMessage = await messagesDatabase
          .select<List<Map<String, dynamic>>>('*, users(*)')
          .eq('chat_id', chats[i].id)
          .order('created_at', ascending: false)
          .limit(1);
          
      if (newestMessage.isNotEmpty) {
        chats[i] = chats[i]
            .copyWith(messages: [MessageModel.fromJson(newestMessage[0])]);
      }
    }
    return chats;
  }

  Future<List<MessageModel>> getMessagesForChat(int chatId) async {
    final messagesResponse = await messagesDatabase
        .select<List<Map<String, dynamic>>>("*, users(*)")
        .eq("chat_id", chatId)
        .order("created_at", ascending: false)
        .limit(50);

    return messagesResponse
        .map((message) => MessageModel.fromJson(message))
        .toList();
  }

  Future<MessageModel> getMessageById(int messageId) async {
    return MessageModel.fromJson(await messagesDatabase
        .select("*, users(*)")
        .eq("id", messageId)
        .single());
  }
}
