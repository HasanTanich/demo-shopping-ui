import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constants/custom_icons.dart';
import '/widgets/icon_button.dart';
import '../providers/home_provider.dart';

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
    {'icon': ButtonIcons.bata, 'name': 'bata', 'isActive': false},
    {'icon': ButtonIcons.angel, 'name': 'angel', 'isActive': false},
    {'icon': ButtonIcons.bookHeart, 'name': 'bookHeart', 'isActive': false},
    {
      'icon': ButtonIcons.cakeBirthday,
      'name': 'cakeBirthday',
      'isActive': false
    },
    {'icon': ButtonIcons.candles, 'name': 'candles', 'isActive': false},
    {'icon': ButtonIcons.couple, 'name': 'couple', 'isActive': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, value, child) => SizedBox(
        height: 76,
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
                filterItems[index]['isActive'] =
                    !filterItems[index]['isActive'];
                filterItems[index]['isActive'] == true
                    ? value.addFilter(filterItems[index]['name'])
                    : value.removeFilter(filterItems[index]['name']);
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
