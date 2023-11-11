import 'package:dnd/providers/shared_preferences_provider.dart';
import 'package:dnd/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FindGroupFilters extends ConsumerWidget {
  const FindGroupFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterNotifierProvider);
    return Row(
      children: [
        Expanded(
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
    );
  }
}
