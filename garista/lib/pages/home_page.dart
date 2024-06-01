import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:garista/components/my_bottom_navbar.dart';
import 'package:garista/pages/dashbord_page.dart';
import 'package:garista/pages/notification_page.dart';
import 'package:garista/pages/orders_page.dart';
import 'package:garista/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    // Dashboard page
    const DashboardPage(),
    // Orders page
    const OrdersPage(),

    // Notificatio Page
    const NotificationPage(),

    // Profile Page
    const ProfilePage(),
  ];
  void NavigationBottombar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onChange: (index) => NavigationBottombar(index),
        currentIndex: _currentIndex,
      ),
      body: Center(
        child: _pages[_currentIndex],
      ),
    );
  }
}
