import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '_shortcuts.dart';

class YgSliderShortcuts {
  static Map<ShortcutActivator, Intent> getNavShortcutMapForNavigationMode(NavigationMode navigationMode) {
    return switch (navigationMode) {
      NavigationMode.directional => _directionalNavShortcutMap,
      NavigationMode.traditional => _traditionalNavShortcutMap,
    };
  }

  // Keyboard mapping for a focused slider when using directional navigation.
  // The vertical inputs are not handled to allow navigating out of the slider.
  static const Map<ShortcutActivator, Intent> _directionalNavShortcutMap = <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.arrowLeft): YgSliderAdjustmentIntent.decrease(),
    SingleActivator(LogicalKeyboardKey.arrowRight): YgSliderAdjustmentIntent.increase(),
  };

  // Keyboard mapping for a focused slider.
  static const Map<ShortcutActivator, Intent> _traditionalNavShortcutMap = <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.arrowUp): YgSliderAdjustmentIntent.increase(),
    SingleActivator(LogicalKeyboardKey.arrowDown): YgSliderAdjustmentIntent.decrease(),
    ..._directionalNavShortcutMap,
  };
}
