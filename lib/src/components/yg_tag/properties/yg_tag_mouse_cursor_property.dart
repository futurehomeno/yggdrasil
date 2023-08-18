import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgTagMouseCursorProperty extends MaterialStateProperty<MouseCursor> with Diagnosticable {
  YgTagMouseCursorProperty({
    required this.mouseCursor,
    required this.disabled,
  });

  final MouseCursor mouseCursor;
  final MouseCursor disabled;

  @override
  MouseCursor resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }

    return mouseCursor;
  }
}
