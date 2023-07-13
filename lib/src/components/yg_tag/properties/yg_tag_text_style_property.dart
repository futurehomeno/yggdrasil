import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class YgTagTextStyleProperty extends MaterialStateProperty<TextStyle?> with Diagnosticable {
  YgTagTextStyleProperty({
    required this.textStyle,
    required this.disabled,
  });

  final TextStyle? textStyle;
  final TextStyle? disabled;

  @override
  TextStyle? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return textStyle;
  }
}
