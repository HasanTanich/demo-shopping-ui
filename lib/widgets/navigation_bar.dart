import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/app_navigation.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});
  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    var appProvider =
        Provider.of<AppNavigationProvider>(context, listen: false);
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      backgroundColor: Colors.white,
      onDestinationSelected: (int index) {
        setState(() {
          appProvider.setSelectedScreenIndex(index);
        });
      },
      selectedIndex: appProvider.currentScreenIndex,
      destinations: const [
        NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.home,
              color: Colors.blueGrey,
            ),
            label: 'Home'),
        NavigationDestination(
            selectedIcon: Icon(
              Icons.favorite,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.favorite,
              color: Colors.blueGrey,
            ),
            label: 'Favorites'),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.shopping_cart,
            color: Colors.blue,
          ),
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.blueGrey,
          ),
          label: 'Shopping Cart',
        ),
        NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            label: 'Profile'),
      ],
    );
  }
}
