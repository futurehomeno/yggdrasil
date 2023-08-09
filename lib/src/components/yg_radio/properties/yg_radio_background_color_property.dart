import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgRadioBackgroundColorProperty extends MaterialStateProperty<Color?> with Diagnosticable {
  YgRadioBackgroundColorProperty({
    required this.selected,
    required this.selectedHovered,
    required this.selectedDisabled,
    required this.deselected,
    required this.deselectedHovered,
    required this.deselectedDisabled,
  });

  final Color? selected;
  final Color? selectedHovered;
  final Color? selectedDisabled;
  final Color? deselected;
  final Color? deselectedHovered;
  final Color? deselectedDisabled;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      if (states.contains(MaterialState.disabled)) {
        return selectedDisabled;
      }
      if (states.contains(MaterialState.hovered)) {
        return selectedHovered;
      }
      return selected;
    }

    if (states.contains(MaterialState.disabled)) {
      return deselectedDisabled;
    }
    if (states.contains(MaterialState.hovered)) {
      return deselectedHovered;
    }
    return deselected;
  }
}
