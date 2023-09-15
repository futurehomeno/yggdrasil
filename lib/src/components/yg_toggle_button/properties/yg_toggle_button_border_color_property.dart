import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgToggleButtonBorderColorProperty extends MaterialStateProperty<Color?> with Diagnosticable {
  YgToggleButtonBorderColorProperty({
    required this.selected,
    required this.selectedDisabled,
    required this.deselected,
    required this.deselectedHovered,
    required this.deselectedPressed,
    required this.deselectedDisabled,
  });

  final Color selected;
  final Color selectedDisabled;
  final Color deselected;
  final Color deselectedHovered;
  final Color deselectedPressed;
  final Color deselectedDisabled;

  Color? resolveWith(Set<MaterialState> states, bool? value) {
    if (value == null) {
      if (states.contains(MaterialState.disabled)) {
        return selectedDisabled;
      }

      return null;
    }

    return resolve(states);
  }

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      if (states.contains(MaterialState.disabled)) {
        return selectedDisabled;
      }

      return selected;
    }

    if (states.contains(MaterialState.disabled)) {
      return deselectedDisabled;
    }
    if (states.contains(MaterialState.pressed)) {
      return deselectedPressed;
    }
    if (states.contains(MaterialState.hovered) || states.contains(MaterialState.focused)) {
      return deselectedHovered;
    }

    return deselected;
  }
}
