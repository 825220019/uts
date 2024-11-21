//kodingan mengikuti yt Cara Menambahkan Default Bottom Navigation Bar Pada FLUTTER Bauroziq

import 'package:flutter/material.dart';
import 'package:uts/screens/home_screen.dart';
import 'package:uts/screens/cart.dart';
import 'package:uts/screens/profil.dart';


class OurHome extends StatefulWidget {
  const OurHome({super.key});

  @override
  _OurHomeState createState() => _OurHomeState();
}


class _OurHomeState extends State<OurHome> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    Cart(),
    ProfilePage()
  ];

  // Fungsi mengubah tab saat ikon ditekan
  void _onBottomTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Fungsi ikon dengan warna sesuai status
  Widget _buildIcon(IconData iconData, int index) {
    return Icon(
      iconData,
      color: _currentIndex == index ? Colors.orange : Colors.grey,
      size: 28,
    );
  }

  // Fungsi untuk membuat daftar item pada BottomNavigationBar
  List<NavigationDestination> _bottomBarItems() {
    return [
      NavigationDestination(
        icon: _buildIcon(Icons.home, 0),
        label: '',
      ),
      NavigationDestination(
        icon: _buildIcon(Icons.shopping_cart, 1),
        label: '',
      ),
      NavigationDestination(
        icon: _buildIcon(Icons.person, 2),
        label: '',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        selectedIndex: _currentIndex,
        onDestinationSelected: _onBottomTap,
        destinations: _bottomBarItems(),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      ),
    );
  }
}
