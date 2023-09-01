import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgToggleButtonTextColorProperty extends MaterialStateProperty<Color> with Diagnosticable {
  YgToggleButtonTextColorProperty({
    required this.selected,
    required this.selectedDisabled,
    required this.deselected,
    required this.deselectedDisabled,
  });

  final Color selected;
  final Color selectedDisabled;
  final Color deselected;
  final Color deselectedDisabled;

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

    return deselected;
  }
}
