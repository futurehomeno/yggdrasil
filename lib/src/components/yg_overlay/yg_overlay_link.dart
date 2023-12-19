import 'package:flutter/material.dart';

import 'yg_overlay_target.dart';

class YgOverlayLink extends ChangeNotifier {
  YgOverlayTargetRenderer? target;

  void needsLayout() {
    notifyListeners();
  }
}
