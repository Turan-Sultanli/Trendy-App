import 'package:flutter/material.dart';
import 'package:trendy_app/screen/home_page_screen.dart';
import 'package:trendy_app/screen/wishlist_page_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      fixedColor: Color(0xFFDB3022),
      currentIndex: _selectedIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        if (index == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePageScreen()));
        }
        if (index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePageScreen()));
        }

        if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WishlistPageScreen()));
        }
                setState(() {
          _selectedIndex = 0;
        });

      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}
