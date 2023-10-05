import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/providers/app_navigation.dart';
import 'package:shopping_app_ui/screens/favorites_screen.dart';
import 'package:shopping_app_ui/screens/home_screen/home_screen.dart';
import 'package:shopping_app_ui/screens/home_screen/providers/home_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppNavigation(),
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
      const FavoritesScreen()
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App Ui',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
        useMaterial3: true,
      ),
      home: Consumer<MyAppNavigation>(
        builder: (context, value, child) => pages[value.currentScreenIndex],
      ),
    );
  }
}
