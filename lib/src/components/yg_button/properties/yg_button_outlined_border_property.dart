import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgButtonOutlinedBorderProperty extends MaterialStateProperty<OutlinedBorder?> with Diagnosticable {
  YgButtonOutlinedBorderProperty({
    required this.outlinedBorder,
    required this.disabled,
  });

  final OutlinedBorder? outlinedBorder;
  final OutlinedBorder? disabled;

  @override
  OutlinedBorder? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }

    return outlinedBorder;
  }
}
