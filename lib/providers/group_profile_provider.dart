import 'package:dnd/model/group.dart';
import 'package:dnd/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'group_profile_provider.g.dart';

@riverpod
Future<Group?> groupDetails(AutoDisposeRef ref, id) {
  return ref.watch(databaseProvider).loadGroup(id);
}
