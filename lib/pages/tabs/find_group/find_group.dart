import 'package:dnd/pages/tabs/find_group/find_group_filters.dart';
import 'package:dnd/pages/tabs/find_group/find_group_list.dart';
import 'package:dnd/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FindGroupTab extends ConsumerStatefulWidget {
  const FindGroupTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FindGroupTabState();
}

class _FindGroupTabState extends ConsumerState<FindGroupTab>
    with AutomaticKeepAliveClientMixin<FindGroupTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(
      children: [
        const Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(child: FindGroupFilters()),
            Expanded(child: FindGroupList()),
          ],
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton(
            heroTag: "find-group",
            onPressed: () async {
              ref.invalidate(locationProvider);
            },
            child: const FaIcon(FontAwesomeIcons.locationCrosshairs),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
