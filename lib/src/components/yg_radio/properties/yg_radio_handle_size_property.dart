import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgRadioHandleSizeProperty extends MaterialStateProperty<double> with Diagnosticable {
  YgRadioHandleSizeProperty({
    required this.selected,
    required this.deselected,
    required this.disabled,
  });

  final double selected;
  final double deselected;
  final double disabled;

  @override
  double resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    if (states.contains(MaterialState.selected)) {
      return selected;
    }

    return deselected;
  }
}
