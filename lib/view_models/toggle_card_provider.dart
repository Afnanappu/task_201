import 'package:flutter/widgets.dart';

class ToggleCardProvider extends ChangeNotifier {
  final Map<int, bool> _toggleStates = {};

  bool isToggled(int index) => _toggleStates[index] ?? true; // default to front

  void toggle(int index) {
    _toggleStates[index] = !isToggled(index);
    notifyListeners();
  }
}
