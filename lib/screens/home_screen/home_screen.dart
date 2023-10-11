import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/screens/home_screen/home_widgets/filters_bar.dart';
import 'package:shopping_app_ui/screens/home_screen/home_widgets/product_card.dart';
import 'package:shopping_app_ui/screens/home_screen/home_widgets/sort_by.dart';
import 'package:shopping_app_ui/screens/home_screen/providers/home_provider.dart';
import 'package:shopping_app_ui/widgets/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Title()),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.start,
                children: [
                  ...homeProvider.getItemsList.map(
                    (item) => HomeCard(
                        rating: item['rating'],
                        isLiked: item['isLiked'],
                        title: item['title'],
                        image: item['image'],
                        subtitle: item['subtitle'],
                        price: item['price']),
                  ),
                ],
              ),
              homeProvider.getItemsList.isEmpty
                  ? const Center(
                      child: Text("No items found with the selected filters"),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        child: Center(child: Text("I am a drawer.")),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(
          Icons.shopping_bag,
          color: Colors.blue,
        ),
        Text(
          "Shoer.lk",
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }
}
