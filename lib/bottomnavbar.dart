import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture/common/Appcolor.dart';
import 'package:furniture/tabbarscreen.dart';
import 'package:furniture/view/favouritescreen.dart';
import 'package:furniture/view/notificationscreen.dart';
import 'package:furniture/view/profilescreen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    TabBarScrnFive(),
    FavoriteScreen(),
    NotificationStoreScrn(),
    ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        elevation: 0,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/Vector.png',
              scale: 3,
              color:
                  _selectedIndex == 0 ? AppColor.primarycolor : Colors.black26,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/marker 1.png',
              scale: 3,
              color:
                  _selectedIndex == 1 ? AppColor.primarycolor : Colors.black26,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/1vecter.png',
              scale: 3,
              color:
                  _selectedIndex == 2 ? AppColor.primarycolor : Colors.black26,
            ),
            label: 'notification',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/image/acc.png',
              scale: 3,
              color:
                  _selectedIndex == 3 ? AppColor.primarycolor : Colors.black26,
            ),
            label: 'Profile',
          ),
        ],
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primarycolor,
        onTap: _onItemTapped,
      ),
    );
  }
}
