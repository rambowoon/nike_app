import 'package:flutter/material.dart';

import '../../constants.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: kIconColor,), label: 'Trang chủ', activeIcon: Icon(Icons.home, color: kPrimaryColor,)),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined, color: kIconColor,), label: 'Chưa làm', activeIcon: Icon(Icons.favorite_outlined, color: kPrimaryColor,)),
        BottomNavigationBarItem(icon: Icon(Icons.add_alert, color: kIconColor,), label: 'Đã làm', activeIcon: Icon(Icons.add_alert, color: kPrimaryColor,)),
        BottomNavigationBarItem(icon: Icon(Icons.people_alt, color: kIconColor,), label: 'Thêm mới', activeIcon: Icon(Icons.people_alt, color: kPrimaryColor,))
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: kPrimaryColor,
      onTap: (int index) {
        switch (index) {
          case 0:
            break;
          case 3:
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
