import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/widgets/my_drawer.dart';
import '/widgets/navigation_bar.dart';
import 'providers/home_provider.dart';
import 'widgets/app_bar_search.dart';
import 'widgets/filters_bar.dart';
import 'widgets/product_card.dart';
import 'widgets/sort_by.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                size: kToolbarHeight - 24,
              ),
            ),
          ),
          title: const Center(child: Title()),
          actions: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: SearchIconButton(),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Products',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        height: 24 / 16,
                        color: Colors.black,
                      ),
                    ),
                    SortBy(),
                  ],
                ),
                const FiltersBar(),
                Consumer<HomeProvider>(
                  builder: (_, value, child) => Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    children: [
                      ...value.getItemsList.map(
                        (item) => HomeCard(
                          rating: item.rating,
                          isLiked: item.isLiked,
                          title: item.title,
                          image: item.image,
                          subtitle: item.subtitle,
                          price: item.price,
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<HomeProvider>(
                  builder: (context, value, child) => value.getItemsList.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Center(
                            child: Text(
                              "No items found with the selected filters",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
        drawer: const Drawer(
          child: Center(child: MyDrawer()),
        ),
        bottomNavigationBar: const MyNavigationBar(),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: kToolbarHeight - 24,
      child: Column(
        children: [
          Icon(
            size: 12,
            Icons.shopping_bag,
            color: Colors.blue,
          ),
          Text(
            "Shoer.lk",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          )
        ],
      ),
    );
  }
}
