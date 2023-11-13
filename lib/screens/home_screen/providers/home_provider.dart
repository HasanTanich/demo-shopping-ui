import 'package:flutter/material.dart';

import '/data.dart';
import '../models/home_product_item_model.dart';

class HomeProvider extends ChangeNotifier {
  var itemsList = List<HomeProductItemModel>.from(homeProductCards);

  String _sortType = 'price';
  final List<String> _filters = [];

  // getter functions
  List<String> get filters => _filters;
  String get sortType => _sortType;
  List<HomeProductItemModel> get getItemsList => getFilteredList(itemsList);

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

  List<HomeProductItemModel> getFilteredList(List<HomeProductItemModel> array) {
    List<HomeProductItemModel> tempArray =
        List<HomeProductItemModel>.from(array);
    if (_filters.isEmpty) {
      sortArray(tempArray, _sortType);
      return tempArray;
    }
    tempArray =
        itemsList.where((item) => _filters.contains(item.brand)).toList();

    sortArray(tempArray, _sortType);
    return tempArray;
  }

  void sortArray(List<HomeProductItemModel> array, String parameter) {
    bool desc = _sortType == 'rating';

    var compareFunctions = {
      'rating': (HomeProductItemModel a, HomeProductItemModel b) =>
          a.rating.compareTo(b.rating),
      'price': (HomeProductItemModel a, HomeProductItemModel b) =>
          a.price.compareTo(b.price),
      'title': (HomeProductItemModel a, HomeProductItemModel b) =>
          a.title.compareTo(b.title),
    };

    array.sort((a, b) {
      var compare = compareFunctions[parameter];
      return desc ? compare!(b, a) : compare!(a, b);
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
