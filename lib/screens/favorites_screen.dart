import 'package:flutter/material.dart';
import 'package:shopping_app_ui/constants/custom_icons.dart';
import 'package:shopping_app_ui/widgets/icon_button.dart';
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
      body: Center(
        child: MyIconButton(
          icon: ButtonIcons.adidas,
          onTap: () {},
        ),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
