import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgCheckboxFillColorProperty extends MaterialStateProperty<Color?> with Diagnosticable {
  YgCheckboxFillColorProperty({
    required this.selected,
    required this.selectedHovered,
    required this.selectedPressed,
    required this.selectedError,
    required this.selectedDisabled,
    required this.deselected,
    required this.deselectedHovered,
    required this.deselectedPressed,
    required this.deselectedError,
    required this.deselectedDisabled,
  });

  final Color? selected;
  final Color? selectedHovered;
  final Color? selectedPressed;
  final Color? selectedError;
  final Color? selectedDisabled;
  final Color? deselected;
  final Color? deselectedHovered;
  final Color? deselectedPressed;
  final Color? deselectedError;
  final Color? deselectedDisabled;

  Color? resolveWith(Set<MaterialState> states, bool? value) {
    if (value == null) {
      if (states.contains(MaterialState.disabled)) {
        return selectedDisabled;
      }
      if (states.contains(MaterialState.pressed)) {
        return selectedPressed;
      }
      if (states.contains(MaterialState.hovered)) {
        return selectedHovered;
      }
    }
    return resolve(states);
  }

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      if (states.contains(MaterialState.disabled)) {
        return selectedDisabled;
      }
      if (states.contains(MaterialState.error)) {
        return selectedError;
      }
      if (states.contains(MaterialState.pressed)) {
        return selectedPressed;
      }
      if (states.contains(MaterialState.hovered)) {
        return selectedHovered;
      }
      return selected;
    }

    if (states.contains(MaterialState.disabled)) {
      return deselectedDisabled;
    }
    if (states.contains(MaterialState.error)) {
      return deselectedError;
    }
    if (states.contains(MaterialState.pressed)) {
      return deselectedPressed;
    }
    if (states.contains(MaterialState.hovered)) {
      return deselectedHovered;
    }
    return deselected;
  }
}
