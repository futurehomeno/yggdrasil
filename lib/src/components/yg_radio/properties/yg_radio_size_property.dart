import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgRadioSizeProperty extends MaterialStateProperty<double?> with Diagnosticable {
  YgRadioSizeProperty({
    required this.selected,
    required this.deselected,
    required this.disabled,
  });

  final double? selected;
  final double? deselected;
  final double? disabled;

  @override
  double? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    if (states.contains(MaterialState.selected)) {
      return selected;
    }
    return deselected;
  }
}
