import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgTabBarOverlayColorProperty extends WidgetStateProperty<Color> with Diagnosticable {
  YgTabBarOverlayColorProperty({
    required this.defaultColor,
    required this.focusedColor,
    required this.pressedColor,
    required this.hoveredColor,
  });

  final Color defaultColor;
  final Color focusedColor;
  final Color pressedColor;
  final Color hoveredColor;

  @override
  Color resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.focused)) {
      return focusedColor;
    } else if (states.contains(WidgetState.pressed)) {
      return pressedColor;
    } else if (states.contains(WidgetState.hovered)) {
      return hoveredColor;
    }

    return defaultColor;
  }
}
