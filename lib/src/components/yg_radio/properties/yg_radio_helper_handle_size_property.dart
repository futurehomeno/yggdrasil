import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgRadioHelperHandleSizeProperty extends MaterialStateProperty<double?> with Diagnosticable {
  YgRadioHelperHandleSizeProperty({
    required this.disabledSelected,
    required this.disabledDeselected,
  });

  final double? disabledSelected;
  final double? disabledDeselected;

  @override
  double? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      if (states.contains(MaterialState.selected)) {
        return disabledSelected;
      }
      return disabledDeselected;
    }
    return 0.0;
  }
}
