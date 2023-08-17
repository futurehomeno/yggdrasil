import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgTagOutlinedBorderProperty extends MaterialStateProperty<OutlinedBorder?> with Diagnosticable {
  YgTagOutlinedBorderProperty({
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
