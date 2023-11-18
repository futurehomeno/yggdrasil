import 'package:flutter/material.dart';

class YgExpansionController extends ChangeNotifier {
  YgExpansionController({
    bool initiallyExpanded = false,
  }) : _expanded = initiallyExpanded;

  bool _expanded;
  bool get expanded => _expanded;
  set expanded(bool newValue) {
    if (_expanded != newValue) {
      _expanded = newValue;
      notifyListeners();
    }
  }

  void toggle() {
    _expanded ^= true;
    notifyListeners();
  }
}
