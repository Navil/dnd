import 'package:dnd/model/group.dart';
import 'package:dnd/model/user.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/services/database_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'database_provider.g.dart';

@riverpod
DatabaseService databaseService(DatabaseServiceRef ref) {
  final user = ref.watch(loggedInUserProvider);
  return DatabaseService(user.id);
}

@riverpod
Future<List<GroupModel>> getGroupsOfUser(GetGroupsOfUserRef ref) async {
  return ref.watch(databaseServiceProvider).getGroupsOfUser();
}

@riverpod
Future<UserModel?> userProfile(UserProfileRef ref, String uid) {
  return ref.watch(databaseServiceProvider).loadUser(uid);
}

@riverpod
Future<GroupModel?> groupDetails(GroupDetailsRef ref, id) {
  return ref.watch(databaseServiceProvider).loadGroup(id);
}

/*
@riverpod
class GroupNotifier extends _$GroupNotifier {
  @override
  Future<List<Group>> build() async {
    _initGroupChannel();
    return ref.read(databaseServiceProvider).getGroupsOfUser();
  }

  void _initGroupChannel() {
    var userId = ref.read(loggedInUserProvider).id;
    ref.read(databaseServiceProvider).membershipListener.on(
      RealtimeListenTypes.postgresChanges,
      ChannelFilter(
          event: '*',
          schema: 'public',
          table: 'members',
          filter: 'user_id=eq.' + userId),
      (payload, [_]) async {
        print(payload);
        state = await AsyncValue.guard(
          () async => ref.read(databaseServiceProvider).getGroupsOfUser(),
        );
      },
    ).subscribe();
  }
}
*/
