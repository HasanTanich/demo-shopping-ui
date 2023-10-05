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
  },
  {
    'rating': 4.8,
    'isLiked': true,
    'title': 'Abc dfg',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello darkness my new friend.",
    'price': 800.09
  },
  {
    'rating': 3.3,
    'isLiked': true,
    'title': 'Casual Brown',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello darkness my old friend.",
    'price': 100.09
  },
  {
    'rating': 0.0,
    'isLiked': false,
    'title': 'Casual Brown',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello darkness my old friend.",
    'price': 10.14
  },
  {
    'rating': 5.0,
    'isLiked': true,
    'title': 'Very Cool shoes',
    'image':
        'https://th.bing.com/th/id/OIP.Q65_bDLVh5JfAzDXp81SmgHaE8?w=300&h=200&c=7&r=0&o=5&pid=1.7',
    'subtitle': "Hello brightness my new friend.",
    'price': 10.14
  }
];

class HomeProvider extends ChangeNotifier {
  String _sortType = 'title';
  final List<Map<String, Object>> itemsList = homeProductCards;
  String get sortType => _sortType;
  get getItemsList => getSortedList();

  void setSortType(String selectedSortType) {
    _sortType = selectedSortType;
    notifyListeners();
  }

  List<Map<String, dynamic>> getSortedList() {
    return sortArray(itemsList, _sortType);
  }

  List<Map<String, dynamic>> sortArray(
      List<Map<String, dynamic>> array, String parameter) {
    array.sort((a, b) {
      if (a[parameter] is num && b[parameter] is num) {
        return (a[parameter] as num).compareTo(b[parameter] as num);
      } else if (a[parameter] is String && b[parameter] is String) {
        return (a[parameter] as String).compareTo(b[parameter] as String);
      }
      return 0;
    });
    return itemsList;
  }
}
