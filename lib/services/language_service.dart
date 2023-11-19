import 'dart:convert';

import 'package:dnd/widgets/language_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'language_service.g.dart';

@riverpod
List<Language> languages(LanguagesRef ref) {
  final languageJsonString = ref.watch(languageJsonDataProvider);
  return _decodeAndParseLanguages(languageJsonString);
}

@riverpod
String systemLanguage(SystemLanguageRef ref) {
  //TODO: Take the device language
  return "en";
}

@riverpod
List<DropdownMenuItem<String>> languageDropdownItems(
    LanguageDropdownItemsRef ref) {
  List<Language> availableLanguages = ref.watch(languagesProvider);

  List<DropdownMenuItem<String>> menuItems = availableLanguages
      .map((language) => DropdownMenuItem(
          value: language.isoCode,
          child: LanguageRow(language)))
      .toList();
  return menuItems;
}

@riverpod
List<Widget> languageDropdownIcons(LanguageDropdownIconsRef ref) {
  List<Language> availableLanguages = ref.watch(languagesProvider);

  List<Widget> menuItems = availableLanguages
      .map((language) => SvgPicture.asset(
            getLanguageAsset(language.isoCode),
            width: 25,
            height: 25,
          ))
      .toList();
  return menuItems;
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

}

String getLanguageAsset(String isoCode) {
  return "assets/language-icons/language/${isoCode.toLowerCase()}.svg";
}
