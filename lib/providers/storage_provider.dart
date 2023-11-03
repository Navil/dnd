import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/services/storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@Riverpod(keepAlive: true)
part 'storage_provider.g.dart';

@riverpod
StorageService storageService(StorageServiceRef ref) {
  final userId = ref.watch(loggedInUserProvider.select((value) => value.id));
  return StorageService(ref, userId);
}
