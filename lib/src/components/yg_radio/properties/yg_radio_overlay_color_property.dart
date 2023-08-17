import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgRadioOverlayColorProperty extends MaterialStateProperty<Color?> with Diagnosticable {
  YgRadioOverlayColorProperty({
    required this.pressed,
    required this.hovered,
  });

  final Color? pressed;
  final Color? hovered;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return pressed;
    }
    if (states.contains(MaterialState.hovered)) {
      return hovered;
    }

    return null;
  }
}
