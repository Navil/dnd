import 'dart:async';

import 'package:dnd/pages/tabs/find_group.dart';
import 'package:dnd/pages/tabs/my_groups.dart';
import 'package:dnd/providers/auth_provider.dart';
import 'package:dnd/providers/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class TabsPage extends ConsumerStatefulWidget {
  const TabsPage({
    super.key,
  });

  @override
  ConsumerState<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends ConsumerState<TabsPage> {
  Timer? _timer;
  final List<Widget> _tabs = <Widget>[FindGroupTab(), MyGroupsTab()];

  final PageController _pageController = PageController();
  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(minutes: 10), (timer) {
      ref.invalidate(getGroupsOfUserProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => context.go("/edit_profile"),
                icon: const FaIcon(FontAwesomeIcons.person)),
            ElevatedButton(
                onPressed: () {
                  ref.read(authServiceProvider).logout();
                },
                child: const Text("Logout"))
          ],
        ),
        body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              _selectedIndexNotifier.value = index;
            },
            children: _tabs),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: _selectedIndexNotifier,
          builder: (context, value, child) => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: value,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Find Groups',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'My Groups',
              ),
            ],
          ),
        ));
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    _selectedIndexNotifier.dispose();
    super.dispose();
  }
}
