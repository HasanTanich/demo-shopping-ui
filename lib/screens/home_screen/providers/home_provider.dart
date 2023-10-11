import 'package:flutter/material.dart';

var homeProductCards = [
  {
    'rating': 4.8,
    'isLiked': false,
    'title': 'I am a shoe',
    'image':
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7ed0855435194229a525aad6009a0497_9366/Superstar_Shoes_White_EG4958_01_standard.jpg',
    'subtitle': "Hello darkness my old friend.",
    'price': 23.09,
    'brand': 'adidas',
  },
  {
    'rating': 4.8,
    'isLiked': true,
    'title': 'Blue shiny',
    'image':
        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c7227d99699243099c24ac5e00406c2c_9366/Forum_Mid_Shoes_White_FY4976_01_standard.jpg',
    'subtitle': "Hello darkness my new friend.",
    'price': 800.09,
    'brand': 'adidas',
  },
  {
    'rating': 3.3,
    'isLiked': true,
    'title': 'Casual Brown',
    'image':
        'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/8a611231-947a-4c84-8de5-2202e2fb12f5/air-max-97-og-mens-shoes-zV9FQs.png',
    'subtitle': "Hello darkness my old friend",
    'price': 100.09,
    'brand': 'nike',
  },
  {
    'rating': 0.0,
    'isLiked': false,
    'title': 'Forum mid shoes white Originals',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello there I am a subtitle",
    'price': 10.14,
    'brand': 'nike',
  },
  {
    'rating': 5.0,
    'isLiked': true,
    'title': 'Very Cool shoes',
    'image':
        'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/5b0981ff-45f8-40c3-9372-32430a62aaea/dunk-high-shoes-n3vgBk.png',
    'subtitle': "I am just an extra text for testing purposes",
    'price': 10.14,
    'brand': 'nike',
  },
  {
    'rating': 2.0,
    'isLiked': true,
    'title': 'Very Cool shoes',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello brightness my new friend.",
    'price': 10.14,
    'brand': 'nike',
  },
  {
    'rating': 2.5,
    'isLiked': true,
    'title': 'Cool shoes grey',
    'image':
        'https://www.ethicalconsumer.org/sites/default/files/styles/place/public/images/2018-05/adidas%20company%20profile.jpg?h=9e499333&itok=kIIAX4Jm',
    'subtitle': "Hello brightness my new friend.",
    'price': 250.99,
    'brand': 'adidas',
  },
  {
    'rating': 1.5,
    'isLiked': false,
    'title': 'Formal shoes',
    'image':
        'https://www.bata.com/dw/image/v2/BCLG_PRD/on/demandware.static/-/Sites-bata-in-master-catalog/default/dwc50138e9/images/large/8246715_7.jpeg?sw=800&sh=800',
    'subtitle': "Formal shoes for work",
    'price': 999.99,
    'brand': 'bata',
  },
  {
    'rating': 4.5,
    'isLiked': true,
    'title': 'BEEHIVE Casual',
    'image':
        'https://www.batabd.com/cdn/shop/products/3_c5910121-88ab-4496-b29f-723a016f4545_1024x1024.jpg?v=1680693898',
    'subtitle': "Bata Beehive casual contemporary sneaker shoe for men",
    'price': 80.00,
    'brand': 'bata',
  },
];

class HomeProvider extends ChangeNotifier {
  String _sortType = 'title';
  final List<String> _filters = [];

  List<String> get filters => _filters;
  String get sortType => _sortType;
  get getItemsList => getFilteredList(homeProductCards);

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

  List<Map<String, dynamic>> getFilteredList(List<Map<String, dynamic>> array) {
    if (_filters.isEmpty) {
      sortArray(array, _sortType);
      return array;
    }
    var filteredList =
        array.where((element) => _filters.contains(element['brand'])).toList();
    sortArray(filteredList, _sortType);
    return filteredList;
  }

  void sortArray(List<Map<String, dynamic>> array, String parameter) {
    bool desc = _sortType == 'rating';
    array.sort((a, b) {
      if (a[parameter] is num && b[parameter] is num) {
        return desc
            ? b[parameter].compareTo(a[parameter])
            : a[parameter].compareTo(b[parameter]);
      } else {
        return desc
            ? b[parameter].compareTo(a[parameter])
            : a[parameter].compareTo(b[parameter]);
      }
    });
  }

  // void sortArray(List<Map<String, dynamic>> array, String parameter) {
  //   bool desc = false;
  //   _sortType == 'rating' ? desc = true : false;
  //   array.sort((a, b) {
  //     if (a[parameter] is num && b[parameter] is num) {
  //       if (desc) {
  //         return a[parameter] < b[parameter] ? 1 : -1;
  //       } else {
  //         return a[parameter] > b[parameter] ? 1 : -1;
  //       }
  //     } else {
  //       if (desc) {
  //         return (b[parameter] as String).compareTo(a[parameter] as String);
  //       } else {
  //         return (a[parameter] as String).compareTo(b[parameter] as String);
  //       }
  //     }
  //   });
  // }
}
