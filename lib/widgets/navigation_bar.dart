import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/providers/app_navigation.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyAppNavigation>(
      builder: (context, value, child) {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 36.0,
          selectedItemColor: Colors.black,
          showSelectedLabels: false,
          onTap: (index) => {
            setState(() {
              value.setSelectedScreenIndex(index);
            }),
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blueGrey,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.blueGrey,
                ),
                label: 'Favorites'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.blueGrey,
              ),
              label: 'Shopping Cart',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                ),
                label: 'Profile'),
          ],
        );
      },
    );
  }
}
