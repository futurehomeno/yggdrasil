import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgCheckboxCheckColorProperty extends MaterialStateProperty<Color?> with Diagnosticable {
  YgCheckboxCheckColorProperty({
    required this.selected,
    required this.disabled,
  });

  final Color? selected;
  final Color? disabled;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return selected;
  }
}
