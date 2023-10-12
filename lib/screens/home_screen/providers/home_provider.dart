import 'package:flutter/material.dart';
import 'package:shopping_app_ui/screens/home_screen/models/home_product_item.dart';

List<HomeProductItem> homeProductCards = [
  HomeProductItem(
    rating: 4.8,
    isLiked: false,
    title: 'I am a shoe',
    image:
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7ed0855435194229a525aad6009a0497_9366/Superstar_Shoes_White_EG4958_01_standard.jpg',
    subtitle: "Hello darkness my old friend.",
    price: 23.09,
    brand: 'adidas',
  ),
  HomeProductItem(
    rating: 4.8,
    isLiked: true,
    title: 'Blue shiny',
    image:
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c7227d99699243099c24ac5e00406c2c_9366/Forum_Mid_Shoes_White_FY4976_01_standard.jpg',
    subtitle: "Hello darkness my new friend.",
    price: 800.09,
    brand: 'adidas',
  ),
  HomeProductItem(
    rating: 3.3,
    isLiked: true,
    title: 'Casual Brown',
    image:
        'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/8a611231-947a-4c84-8de5-2202e2fb12f5/air-max-97-og-mens-shoes-zV9FQs.png',
    subtitle: "Hello darkness my old friend",
    price: 100.09,
    brand: 'nike',
  ),
  HomeProductItem(
    rating: 0.0,
    isLiked: false,
    title: 'Forum shoes white',
    image:
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    subtitle: "Hello there I am a subtitle",
    price: 25.14,
    brand: 'nike',
  ),
  HomeProductItem(
    rating: 5.0,
    isLiked: true,
    title: 'Very Cool shoes',
    image:
        'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/5b0981ff-45f8-40c3-9372-32430a62aaea/dunk-high-shoes-n3vgBk.png',
    subtitle: "I am just an extra text for testing purposes",
    price: 60.14,
    brand: 'nike',
  ),
  HomeProductItem(
    rating: 2.0,
    isLiked: true,
    title: 'Very Cool shoes',
    image:
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    subtitle: "Hello brightness my new friend.",
    price: 50.14,
    brand: 'nike',
  ),
  HomeProductItem(
    rating: 2.5,
    isLiked: true,
    title: 'Cool shoes grey',
    image:
        'https://www.ethicalconsumer.org/sites/default/files/styles/place/public/images/2018-05/adidas%20company%20profile.jpg?h=9e499333&itok=kIIAX4Jm',
    subtitle: "Hello brightness my new friend.",
    price: 250.99,
    brand: 'adidas',
  ),
  HomeProductItem(
    rating: 1.5,
    isLiked: false,
    title: 'Formal shoes',
    image:
        'https://www.bata.com/dw/image/v2/BCLG_PRD/on/demandware.static/-/Sites-bata-in-master-catalog/default/dwc50138e9/images/large/8246715_7.jpeg?sw=800&sh=800',
    subtitle: "Formal shoes for work",
    price: 999.99,
    brand: 'bata',
  ),
  HomeProductItem(
    rating: 4.5,
    isLiked: true,
    title: 'BEEHIVE Casual',
    image:
        'https://www.batabd.com/cdn/shop/products/3_c5910121-88ab-4496-b29f-723a016f4545_1024x1024.jpg?v=1680693898',
    subtitle: "Bata Beehive casual contemporary sneaker shoe",
    price: 80.00,
    brand: 'bata',
  ),
];

class HomeProvider extends ChangeNotifier {
  var itemsList = List<HomeProductItem>.from(homeProductCards);

  String _sortType = 'price';
  final List<String> _filters = [];

  List<String> get filters => _filters;
  String get sortType => _sortType;
  List<HomeProductItem> get getItemsList => getFilteredList(itemsList);

  void setSortType(String selectedSortType) {
    _sortType = selectedSortType;
    notifyListeners();
  }

  void addFilter(String selectedFilter) {
    filters.add(selectedFilter);
    notifyListeners();
  }

  void removeFilter(String selectedFilter) {
    filters.remove(selectedFilter);
    notifyListeners();
  }

  List<HomeProductItem> getFilteredList(List<HomeProductItem> array) {
    List<HomeProductItem> tempArray = List<HomeProductItem>.from(array);
    if (_filters.isEmpty) {
      sortArray(tempArray, _sortType);
      return tempArray;
    }
    tempArray =
        itemsList.where((item) => _filters.contains(item.brand)).toList();

    sortArray(tempArray, _sortType);
    return tempArray;
  }

  void sortArray(List<HomeProductItem> array, String parameter) {
    bool desc = _sortType == 'rating';
    array.sort((a, b) {
      if (parameter == 'rating') {
        return desc
            ? b.rating.compareTo(a.rating)
            : a.rating.compareTo(b.rating);
      } else if (parameter == 'price') {
        return desc ? b.price.compareTo(a.price) : a.price.compareTo(b.price);
      } else {
        // Handle other sorting criteria if needed
        return desc
            ? b.title.compareTo(a.title)
            : a.title.compareTo(b.title); // Default case
      }
    });
  }

  void toggleLikeButton(String title) {
    for (var item in itemsList) {
      if (item.title == title) {
        item.isLiked = !item.isLiked;
        break;
      }
    }
    notifyListeners();
  }
}
