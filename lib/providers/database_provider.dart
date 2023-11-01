import 'package:dnd/model/group.dart';
import 'package:dnd/model/user.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/location_provider.dart';
import 'package:dnd/services/database_service.dart';
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
Future<GroupModel?> groupDetails(GroupDetailsRef ref, id) {
  return ref.watch(databaseServiceProvider).loadGroup(id);
}

@riverpod
Future<List<GroupSearchResult>> nearbyGroups(NearbyGroupsRef ref) async {
  final location = await ref.watch(locationProvider.future);
  final data =
      List.from(await Supabase.instance.client.rpc('nearby_groups', params: {
    'lat': location.latitude,
    'long': location.longitude,
  }));
  print(data[0]);
  return data
      .map((group) =>
          GroupSearchResult(GroupModel.fromJson(group), group["dist_meters"]))
      .toList();
}

class GroupSearchResult {
  GroupModel group;
  num distanceInMeters;

  GroupSearchResult(this.group, this.distanceInMeters);
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
