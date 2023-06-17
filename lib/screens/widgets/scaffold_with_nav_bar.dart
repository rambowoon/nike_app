import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../setting_language.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({super.key, required this.child});

  final Widget child;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  int _currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    final List<MyCustomBottomNavBarItem> tabs = [
      MyCustomBottomNavBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home),
        label: ngonngu(context).trangchu,
        initialLocation: '/',
      ),
      MyCustomBottomNavBarItem(
        icon: Icon(Icons.favorite_outlined),
        activeIcon: Icon(Icons.favorite_outlined),
        label: ngonngu(context).yeuthich,
        initialLocation: '/yeuthich',
      ),
      MyCustomBottomNavBarItem(
        icon: Icon(Icons.list_alt),
        activeIcon: Icon(Icons.list_alt),
        label: ngonngu(context).tintuc,
        initialLocation: '/tintuc',
      ),
      MyCustomBottomNavBarItem(
        icon: Icon(Icons.settings),
        activeIcon: Icon(Icons.settings),
        label: ngonngu(context).caidat,
        initialLocation: '/setting',
      ),
    ];
    const labelStyle = TextStyle(fontFamily: 'Roboto');
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        selectedItemColor: const Color(0xFF434343),
        selectedFontSize: 12,
        unselectedItemColor: const Color(0xFF838383),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          _goOtherTab(tabs, context, index);
        },
        currentIndex: _currentIndex,
        items: tabs,
      ),
    );
  }

  void _goOtherTab(List<MyCustomBottomNavBarItem> tabs, BuildContext context, int index) {
    if (index == _currentIndex) return;
    GoRouter router = GoRouter.of(context);
    String location = tabs[index].initialLocation;

    setState(() {
      _currentIndex = index;
      router.go(location);
    });
  }
}

class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const MyCustomBottomNavBarItem(
      {required this.initialLocation,
        required Widget icon,
        String? label,
        Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon ?? icon);
}