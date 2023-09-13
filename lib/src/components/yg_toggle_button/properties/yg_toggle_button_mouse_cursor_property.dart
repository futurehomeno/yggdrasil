import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgToggleButtonMouseCursorProperty extends MaterialStateProperty<MouseCursor> with Diagnosticable {
  YgToggleButtonMouseCursorProperty({
    required this.enabled,
    required this.disabled,
  });

  final MouseCursor enabled;
  final MouseCursor disabled;

  @override
  MouseCursor resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }

    return enabled;
  }
}
