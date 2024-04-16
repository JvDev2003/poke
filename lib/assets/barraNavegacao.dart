import 'package:flutter/material.dart';

class BottomNavigationMenu extends StatelessWidget {

  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationMenu({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Pokedex',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Times', 
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}