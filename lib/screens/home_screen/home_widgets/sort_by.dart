import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/screens/home_screen/providers/home_provider.dart';

enum SortType {
  price,
  rating,
  title,
}

class SortBy extends StatelessWidget {
  const SortBy({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Row(
        children: [
          const Text(
            'Sort by',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            onSelected: (SortType selectedSortType) {
              if (selectedSortType == SortType.price) {
                homeProvider.setSortType('price');
              } else if (selectedSortType == SortType.rating) {
                homeProvider.setSortType('rating');
              } else {
                homeProvider.setSortType('title');
              }
            },
            itemBuilder: (context) => <PopupMenuItem<SortType>>[
              PopupMenuItem<SortType>(
                enabled: homeProvider.sortType != 'price',
                value: SortType.price,
                child: const Text(
                  'Price',
                ),
              ),
              PopupMenuItem<SortType>(
                enabled: homeProvider.sortType != 'rating',
                value: SortType.rating,
                child: const Text(
                  'Rating',
                ),
              ),
              PopupMenuItem<SortType>(
                enabled: homeProvider.sortType != 'title',
                value: SortType.title,
                child: const Text(
                  'Title',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
