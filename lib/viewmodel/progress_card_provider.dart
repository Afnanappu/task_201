import 'package:flutter/material.dart';

class ProgressCardProvider extends ChangeNotifier {
  int total = 15;
  int current = 0;

  void set(int value) {
    current = value;
    notifyListeners();
  }

  void next() {
    if (current == total) return;
    current += 1;
    notifyListeners();
  }

  void previous() {
    if (current == 0) return;
    current -= 1;
    notifyListeners();
  }
}
