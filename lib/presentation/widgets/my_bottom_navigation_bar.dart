import 'package:flutter/material.dart';
import 'package:hotel/core/design/icons.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  const MyBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: iconDoorGray24,
          activeIcon: iconDoor24,
          label: 'Номера',
        ),
        BottomNavigationBarItem(
          icon: iconPersonGray24,
          activeIcon: iconPerson24,
          label: 'Туристы',
        ),
        BottomNavigationBarItem(
          icon: iconCartGray24,
          activeIcon: iconCart24,
          label: 'Корзина',
        ),
      ],
      currentIndex: currentIndex,
    );
  }
}
