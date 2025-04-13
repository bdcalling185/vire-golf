import 'package:flutter/material.dart';
import 'package:vire_glof/colors.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  // Pages for each tab
  final List<Widget> _pages = [
    // const HomeScreen(),
    // const CalendarScreen(),
    // const RootTaskScreen(),
    // const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png'),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/root_calender.png'),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/retuals.png'),
            label: "Rituals",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/profile.png'),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
