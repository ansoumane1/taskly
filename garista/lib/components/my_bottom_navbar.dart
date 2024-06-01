import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onChange;
  int currentIndex;
  MyBottomNavBar(
      {super.key, required this.onChange, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    //
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onChange!(value),
      backgroundColor: Colors.grey.shade400 ,
      iconSize: 20.0,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35, color: Colors.black87),
            label: "Dashboard"),
        BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 35, color: Colors.black87),
            label: "Orders"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 35, color: Colors.black87),
            label: "Notifications"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 35, color: Colors.black87),
            label: "Profile"),
      ],
    );
  }
}
