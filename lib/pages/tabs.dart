import 'package:dnd/pages/tabs/find_group.dart';
import 'package:dnd/pages/tabs/my_groups.dart';
import 'package:dnd/providers/auth_provider.dart';
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
  int _selectedIndex = 0;

  final List<Widget> _tabs = <Widget>[FindGroupTab(), MyGroupsTab()];

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
      body: _tabs.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
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
    );
  }

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }
}
