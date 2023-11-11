import 'package:dnd/model/search_filters.dart';
import 'package:dnd/services/shared_preferences_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'shared_preferences_provider.g.dart';

@riverpod
class FilterNotifier extends _$FilterNotifier {
  @override
  SearchFilters build() {
    return ref.read(sharedPreferencesServiceProvider).getFilterPreferences();
  }

  Future<void> updateFilters(SearchFilters newFilters) async {
    state = newFilters;
  }
}
