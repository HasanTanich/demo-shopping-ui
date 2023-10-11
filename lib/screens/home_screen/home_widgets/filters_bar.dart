import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/constants/custom_icons.dart';
import 'package:shopping_app_ui/screens/home_screen/providers/home_provider.dart';
import 'package:shopping_app_ui/widgets/icon_button.dart';

class FiltersBar extends StatefulWidget {
  const FiltersBar({super.key});

  @override
  State<FiltersBar> createState() => _FiltersBarState();
}

class _FiltersBarState extends State<FiltersBar> {
  List<Map<String, dynamic>> filterItems = [
    {'icon': ButtonIcons.adidas, 'name': 'adidas', 'isActive': false},
    {'icon': ButtonIcons.nike, 'name': 'nike', 'isActive': false},
    {'icon': ButtonIcons.puma, 'name': 'puma', 'isActive': false},
    {'icon': ButtonIcons.airplane, 'name': 'bata', 'isActive': false},
    {'icon': ButtonIcons.angel, 'name': 'bata', 'isActive': false},
    {'icon': ButtonIcons.bookHeart, 'name': 'bata', 'isActive': false},
    {'icon': ButtonIcons.cakeBirthday, 'name': 'bata', 'isActive': false},
    {'icon': ButtonIcons.candles, 'name': 'bata', 'isActive': false},
    {'icon': ButtonIcons.couple, 'name': 'bata', 'isActive': false},
  ];

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filterItems.length,
        separatorBuilder: (context, index) => const Divider(indent: 14.0),
        itemBuilder: (context, index) => SizedBox(
          height: 60,
          child: MyIconButton(
            icon: filterItems[index]['icon'] as String,
            isActive: filterItems[index]['isActive'] as bool,
            onTap: () {
              filterItems[index]['isActive'] = !filterItems[index]['isActive'];
              filterItems[index]['isActive'] == true
                  ? homeProvider.addFilter(filterItems[index]['name'])
                  : homeProvider.removeFilter(filterItems[index]['name']);
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
