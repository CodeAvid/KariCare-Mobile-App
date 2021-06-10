import 'package:flutter/material.dart';
import 'package:kari_care_flutter/screens/screens.dart';
import 'package:kari_care_flutter/widgets/widgets.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<IconData> _icons = [
    Icons.home,
    Icons.person,
  ];

  final List<Widget> _screens = [HomeScreen(), ProfileScreen()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          color: Colors.white,
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(
              () => _selectedIndex = index,
            ),
          ),
        ),
      ),
    );
  }
}
