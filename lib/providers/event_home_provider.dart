import 'package:flutter/material.dart';

class EventHomeProvider extends ChangeNotifier {
  int homeIndex = 0;

  void updateIndex(int newIndex) {
    homeIndex = newIndex;
    notifyListeners();
  }
}
