import 'package:dnd/providers/shared_preferences_provider.dart';
import 'package:dnd/services/language_service.dart';
import 'package:dnd/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FindGroupFilters extends ConsumerStatefulWidget {
  const FindGroupFilters({super.key});

  @override
  ConsumerState<FindGroupFilters> createState() => _FindGroupFiltersState();
}

class _FindGroupFiltersState extends ConsumerState<FindGroupFilters> {
  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(filterNotifierProvider);
    return ExpansionTile(
      initiallyExpanded: true,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SvgPicture.asset(
          getLanguageAsset(filters.groupLanguage),
          width: 25,
          height: 25,
        )
      ]),
      children: [
        DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
                isExpanded: true,
                value: filters.groupLanguage,
                selectedItemBuilder: (context) {
                  return ref.watch(languageDropdownItemsProvider);
                },
                onChanged: (String? newValue) {
                  ref.read(filterNotifierProvider.notifier).updateFilters(
                      filters.copyWith(groupLanguage: newValue!));
                },
                items: ref.watch(languageDropdownItemsProvider)),
          ),
        ),
        Row(
          children: [
            Flexible(
              child: CheckboxListTile.adaptive(
                title: const Text("Remote"),
                value: filters.isRemote,
                onChanged: (value) async {
                  ref
                      .read(filterNotifierProvider.notifier)
                      .updateFilters(filters.copyWith(isRemote: value == true));
                },
              ),
            ),
           
            IconButton(
              onPressed: () async {
                await ref
                    .read(sharedPreferencesServiceProvider)
                    .setFilterPreferences(filters);

                ref.invalidate(sharedPreferencesServiceProvider);
              },
              icon: const FaIcon(FontAwesomeIcons.arrowsRotate),
              color: Theme.of(context).primaryColor,
            )
          ],
        )
      ],
    );
  }
}
