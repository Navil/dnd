import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_filters.freezed.dart';
part 'search_filters.g.dart';

@freezed
class SearchFilters with _$SearchFilters {
  factory SearchFilters({
  @Default(true) @JsonKey(name: "remote") bool isRemote,
      @Default("en") String groupLanguage
  }) = _SearchFilters;

  factory SearchFilters.fromJson(Map<String, dynamic> json) =>
      _$SearchFiltersFromJson(json);
}
