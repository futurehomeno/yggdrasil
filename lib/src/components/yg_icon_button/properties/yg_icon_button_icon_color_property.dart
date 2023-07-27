import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgIconButtonIconColorProperty extends MaterialStateProperty<Color?> with Diagnosticable {
  YgIconButtonIconColorProperty({
    required this.color,
    required this.disabled,
  });

  final Color? color;
  final Color? disabled;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return color;
  }
}
