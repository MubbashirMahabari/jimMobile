import 'package:flutter/material.dart';

BottomNavigationBar buildBottomNavigationBar(
    int selectedIndex, Function(int) onItemTapped) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: const Color(0xFF0157C8),
    fixedColor: Colors.white,
    unselectedItemColor: Colors.white.withOpacity(1),
    currentIndex: selectedIndex,
    onTap: onItemTapped,
    items: [
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/home.png'), label: 'Home'),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/lead_icon.png'), label: 'Leads'),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/schedule.png'), label: 'Schedule'),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/jobs.png'), label: 'Jobs'),
      BottomNavigationBarItem(
          icon: Image.asset('assets/icons/menu.png'), label: 'Menu'),
    ],
  );
}
