import 'package:flutter/material.dart';

class AppNavigationProvider extends ChangeNotifier {
  int _currentScreenIndex = 0;
  int get currentScreenIndex => _currentScreenIndex;

  void setSelectedScreenIndex(int index) {
    _currentScreenIndex = index;
    notifyListeners();
  }
}
