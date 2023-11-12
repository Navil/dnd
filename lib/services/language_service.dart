import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'language_service.g.dart';

@riverpod
List<Language> languages(LanguagesRef ref) {
  final languageJsonString = ref.watch(languageJsonDataProvider);
  return _decodeAndParseLanguages(languageJsonString);
}

List<Language> _decodeAndParseLanguages(String languageData) {
  return List<Map<String, dynamic>>.from(
          (jsonDecode(languageData) as List<dynamic>))
      .map((language) => Language.fromJson(language))
      .toList();
}

@riverpod
String languageJsonData(LanguageJsonDataRef ref) {
  throw UnimplementedError();
}

class Language {
  final String isoCode;
  final String name;

  Language(this.isoCode, this.name);

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(json['isoCode'] as String, json['name'] as String);
  }

  String getPath() {
    return "assets/language-icons/language/${isoCode.toLowerCase()}.svg";
  }
}
