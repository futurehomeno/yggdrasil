import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgRadioHandleColorProperty extends MaterialStateProperty<Color> with Diagnosticable {
  YgRadioHandleColorProperty({
    required this.selected,
    required this.deselected,
    required this.disabled,
  });

  final Color selected;
  final Color deselected;
  final Color disabled;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    if (states.contains(MaterialState.selected)) {
      return selected;
    }

    return deselected;
  }
}
