import 'package:dnd/services/language_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class LanguageRow extends ConsumerWidget {
  final Language language;
  const LanguageRow(this.language, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SvgPicture.asset(
            getLanguageAsset(language.isoCode),
            width: 25,
            height: 25,
          ),
        ),
        Flexible(
            child: Text(
          language.name,
          overflow: TextOverflow.ellipsis,
        )),
      ],
    );
  }
}
