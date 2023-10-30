import 'package:dnd/model/group.dart';
import 'package:dnd/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupDetailsProvider = FutureProvider.family<Group?, int>((ref, id) {
  return ref.watch(supabaseProvider).loadGroup(id);
});
