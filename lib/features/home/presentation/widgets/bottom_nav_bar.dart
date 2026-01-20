import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const BottomNavBar({required this.currentIndex,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 60,
      backgroundColor: Colors.transparent,
      color: Colors.lightGreen,
      index: currentIndex,
      onTap: onTap,
      letIndexChange: (value) {
        return true;
      },
      items: [
        Icon(Icons.home, color: Colors.white, size: 20,semanticLabel: 'Home',),
        Icon(Icons.map, color: Colors.white, size: 20),
        Icon(Icons.near_me, color: Colors.white, size: 20),
        // Icon(Icons.favorite, color: Colors.white, size: 20),
      ],
    );
  }
}
