import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/app_navigation.dart';
import 'screens/cart_screen.dart';
import 'screens/favorites_screen/favorites_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/home_screen/providers/home_provider.dart';
import 'screens/profile_screen/profile_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppNavigationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        child: const HomeScreen(),
      ),
      FavoritesScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App Ui',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
        useMaterial3: true,
      ),
      home: Consumer<AppNavigationProvider>(
        builder: (context, value, child) => pages[value.currentScreenIndex],
      ),
    );
  }
}
