import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.wallet, color: Color.fromARGB(255, 196, 183, 39),), label: 'Wallet'),
      BottomNavigationBarItem(icon: Icon(Icons.person, color: Color.fromARGB(255, 196, 183, 39),), label: 'Profile')
    ],
    backgroundColor: Colors.black,);
  }
}