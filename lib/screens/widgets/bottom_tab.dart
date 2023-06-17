import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';
import '../../setting_language.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: kIconColor,), label: ngonngu(context).trangchu, activeIcon: Icon(Icons.home, color: kPrimaryColor,)),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined, color: kIconColor,), label: ngonngu(context).yeuthich, activeIcon: Icon(Icons.favorite_outlined, color: kPrimaryColor,)),
        BottomNavigationBarItem(icon: Icon(Icons.add_alert, color: kIconColor,), label: ngonngu(context).tintuc, activeIcon: Icon(Icons.add_alert, color: kPrimaryColor,)),
        BottomNavigationBarItem(icon: Icon(Icons.settings, color: kIconColor,), label: ngonngu(context).caidat, activeIcon: Icon(Icons.settings, color: kPrimaryColor,))
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: kPrimaryColor,
      onTap: (int index) {
        switch (index) {
          case 0:
            context.go('/');
            break;
          case 3:
            context.go('/setting');
            break;
        }
        setState(
              () {
            _selectedIndex = index;
          },
        );
      },
    );
  }
}
