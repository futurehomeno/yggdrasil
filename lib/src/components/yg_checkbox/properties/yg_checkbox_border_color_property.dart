import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgCheckboxBorderColorProperty extends MaterialStateProperty<Color?> with Diagnosticable {
  YgCheckboxBorderColorProperty({
    required this.selectedDisabled,
    required this.deselected,
    required this.deselectedHovered,
    required this.deselectedPressed,
    required this.deselectedError,
    required this.deselectedDisabled,
  });

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
      return null;
    }
    return resolve(states);
  }

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      if (states.contains(MaterialState.disabled)) {
        return selectedDisabled;
      }
      return null;
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
