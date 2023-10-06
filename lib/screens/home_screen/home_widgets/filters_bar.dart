import 'package:flutter/material.dart';
import 'package:shopping_app_ui/constants/custom_icons.dart';
import 'package:shopping_app_ui/widgets/icon_button.dart';

class FiltersBar extends StatelessWidget {
  const FiltersBar({super.key});

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
    return SizedBox(
      height: 66,
      child: SizedBox(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          separatorBuilder: (context, index) => const Divider(indent: 14.0),
          itemBuilder: (context, index) => MyIconButton(
            icon: items[index],
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
