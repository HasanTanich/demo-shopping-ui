import 'package:flutter/material.dart';

class MyAppNavigation extends ChangeNotifier {
  int _currentScreenIndex = 0;
  int get currentScreenIndex => _currentScreenIndex;

  void setSelectedScreenIndex(int? index) {
    _currentScreenIndex = index ?? 0;
    notifyListeners();
  }
}
