import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgTabBarOverlayColorProperty extends MaterialStateProperty<Color> with Diagnosticable {
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
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.focused)) {
      return focusedColor;
    } else if (states.contains(MaterialState.pressed)) {
      return pressedColor;
    } else if (states.contains(MaterialState.hovered)) {
      return hoveredColor;
    }

    return defaultColor;
  }
}
