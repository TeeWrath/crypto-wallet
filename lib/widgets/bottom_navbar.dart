import 'package:flutter/material.dart';
import 'package:wlt/utils.dart';
import 'package:wlt/view/home_view.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: primaryTextColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet,
              color: secondaryColor,
            ),
            label: 'Wallet',
            activeIcon: HomeScreen()),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: secondaryColor,
            ),
            label: 'Profile')
      ],
      backgroundColor: Colors.black,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
