import 'package:flutter/material.dart';
import 'package:shopping_app_ui/widgets/navigation_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Favorites Page"),
      ),
      body: const Center(
        child: Text('hehe'),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
