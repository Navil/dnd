import 'package:dnd/providers/shared_preferences_provider.dart';
import 'package:dnd/services/language_service.dart';
import 'package:dnd/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Row(
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
        Flexible(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                  isDense: true,
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
    );
  }
}
