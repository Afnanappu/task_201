import 'package:flutter/widgets.dart';

class ToggleCardProvider extends ChangeNotifier {
  bool isToggle = true;

  void toggle() {
    isToggle = !isToggle;
    notifyListeners();
  }
}
