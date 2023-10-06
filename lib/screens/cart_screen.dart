import 'package:flutter/material.dart';
import 'package:shopping_app_ui/screens/home_screen/home_widgets/filters_bar.dart';
import 'package:shopping_app_ui/widgets/navigation_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: const Center(
        child: FiltersBar(),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
