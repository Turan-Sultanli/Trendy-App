import 'package:flutter/material.dart';
import 'package:trendy_app/screen/cart_page_screen.dart';
import 'package:trendy_app/screen/home_page_screen.dart';
import 'package:trendy_app/screen/profile_page_screen.dart';
import 'package:trendy_app/screen/wishlist_page_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        HomePageScreen(),
        CartPageScreen(),
        WishlistPageScreen(),
        ProfilePageScreen(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        fixedColor: const Color(0xFFDB3022),
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
