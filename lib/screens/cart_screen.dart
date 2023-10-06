import 'package:flutter/material.dart';
import 'package:shopping_app_ui/constants/custom_icons.dart';
import 'package:shopping_app_ui/widgets/icon_button.dart';
import 'package:shopping_app_ui/widgets/navigation_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      ButtonIcons.adidas,
      ButtonIcons.airplane,
      ButtonIcons.angel,
      ButtonIcons.bookHeart,
      ButtonIcons.cakeBirthday,
      ButtonIcons.candles,
      ButtonIcons.couple,
      ButtonIcons.nike,
      ButtonIcons.puma,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Center(
          child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items
              .map(
                (e) => MyIconButton(
                  icon: e,
                  onTap: () {},
                ),
              )
              .toList(),
        ),
      )),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
