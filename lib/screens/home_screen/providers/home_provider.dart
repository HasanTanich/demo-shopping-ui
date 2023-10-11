import 'package:flutter/material.dart';

var homeProductCards = [
  {
    'rating': 4.8,
    'isLiked': false,
    'title': 'I am a shoe',
    'image':
        'https://th.bing.com/th/id/OIP.QXg7Nbu8v5dzZyYFPVwoYAHaE6?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello darkness my old friend.",
    'price': 23.09,
    'brand': 'adidas',
  },
  {
    'rating': 4.8,
    'isLiked': true,
    'title': 'Abc dfg',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello darkness my new friend.",
    'price': 800.09,
    'brand': 'adidas',
  },
  {
    'rating': 3.3,
    'isLiked': true,
    'title': 'Casual Brown',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello darkness my old friend.",
    'price': 100.09,
    'brand': 'nike',
  },
  {
    'rating': 0.0,
    'isLiked': false,
    'title': 'Casual Brown',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello darkness my old friend.",
    'price': 10.14,
    'brand': 'adidas',
  },
  {
    'rating': 5.0,
    'isLiked': true,
    'title': 'Very Cool shoes',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello brightness my new friend.",
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
    'brand': 'puma',
  },
  {
    'rating': 2.5,
    'isLiked': true,
    'title': 'Very Cool shoes',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello brightness my new friend.",
    'price': 10.14,
    'brand': 'adidas',
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
    array.sort((a, b) {
      if (a[parameter] is num && b[parameter] is num) {
        return (a[parameter] as num).compareTo(b[parameter] as num);
      } else {
        return (a[parameter] as String).compareTo(b[parameter] as String);
      }
    });
  }
}
