import 'package:dnd/model/chat.dart';
import 'package:dnd/model/group.dart';
import 'package:dnd/model/message.dart';
import 'package:dnd/model/user.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/location_provider.dart';
import 'package:dnd/services/database_service.dart';
import 'package:dnd/services/shared_preferences_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
DatabaseService databaseService(DatabaseServiceRef ref) {
  final userId = ref.watch(loggedInUserProvider.select((value) => value.id));
  return DatabaseService(ref, userId);
}

@riverpod
Future<List<GroupModel>> getGroupsOfUser(GetGroupsOfUserRef ref) async {
  return ref.watch(databaseServiceProvider).getGroupsOfUser();
}

@riverpod
Future<List<ChatModel>> getChatRequestsOfUser(
    GetChatRequestsOfUserRef ref) async {
  return ref.watch(databaseServiceProvider).getChatRequestsOfUser();
}

@Riverpod(keepAlive: true)
Future<UserModel?> userProfile(UserProfileRef ref, String uid) {
  return ref.watch(databaseServiceProvider).loadUser(uid);
}

@Riverpod(keepAlive: true)
bool hasUserProfile(HasUserProfileRef ref) {
  final userId = ref.watch(loggedInUserProvider.select((value) => value.id));
  final userProfileData = ref.watch(userProfileProvider(userId));
  return userProfileData.when(
    data: (profile) => profile != null,
    loading: () => true,
    error: (_, __) => false,
  );
}

@riverpod
Future<GroupModel?> groupDetails(GroupDetailsRef ref, int id) {
  return ref.watch(databaseServiceProvider).loadGroup(id);
}

@riverpod
Future<List<GroupSearchResult>> findGroups(FindGroupsRef ref) async {
  final filters =
      ref.watch(sharedPreferencesServiceProvider).getFilterPreferences();

  Position? location;
  if (!filters.isRemote) {
    location = await ref.watch(locationProvider.future);
  }

  final test = await Supabase.instance.client
      .rpc('is_user_member_of_group', params: {"p_group_id": 3000});
  print(test);

  final data =
      List.from(await Supabase.instance.client.rpc('find_groups', params: {
    'lat': location != null ? location.latitude : 0,
    'long': location != null ? location.longitude : 0,
    ...filters.toJson()
  }));

  print(data);

  return data
      .map((group) => GroupSearchResult(
          GroupModel.fromJson(group),
          group["dist_meters"],
          group["num_members"],
          group["num_dms"],
          group["num_members"] - group["num_dms"]))
      .toList();
}

class GroupSearchResult {
  GroupModel group;
  double? distanceInMeters;
  int numMembers;
  int numDungeonMasters;
  int numPlayers;

  GroupSearchResult(this.group, this.distanceInMeters, this.numMembers,
      this.numDungeonMasters, this.numPlayers);
}

@riverpod
class ChatMessageNotifier extends _$ChatMessageNotifier {
  @override
  Future<List<MessageModel>> build(int chatId) async {
    _initMessages(chatId);
    return ref.watch(databaseServiceProvider).getMessagesForChat(chatId);
  }

  void _initMessages(int chatId) {
    Supabase.instance.client.channel('public:messaged:id=eq.$chatId').on(
      RealtimeListenTypes.postgresChanges,
      ChannelFilter(
          event: 'INSERT',
          schema: 'public',
          table: 'messages',
          filter: 'chat_id=eq.$chatId'),
      (payload, [_]) async {
        final newId = payload["new"]["id"];

        MessageModel message =
            await ref.watch(databaseServiceProvider).getMessageById(newId);
        state.whenData((value) {
          state = AsyncValue.data([message, ...value]);
        });
      },
    ).subscribe();
  }
}
