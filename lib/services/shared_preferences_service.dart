import 'dart:convert';

import 'package:dnd/model/search_filters.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'shared_preferences_service.g.dart';

@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

@riverpod
SharedPreferencesService sharedPreferencesService(
    SharedPreferencesServiceRef ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesService(sharedPreferences: sharedPrefs);
}

class SharedPreferencesService {
  SharedPreferencesService({
    required this.sharedPreferences,
  });
  final SharedPreferences sharedPreferences;

  Future<void> setFilterPreferences(SearchFilters prefs) async {
    await sharedPreferences.setString(
        'filterPreferences', jsonEncode(prefs.toJson()));
  }

  SearchFilters getFilterPreferences() {
    final prefsString = sharedPreferences.getString('filterPreferences');
    return prefsString != null
        ? SearchFilters.fromJson(jsonDecode(prefsString))
        : SearchFilters();
  }
}
