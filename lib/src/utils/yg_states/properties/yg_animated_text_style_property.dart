import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAnimatedTextStyleProperty<T extends Enum> extends YgAnimatedProperty<T, TextStyle> {
  YgAnimatedTextStyleProperty.fromStyle(
    super.style,
    super.resolve,
  ) : super.fromStyle();

  @override
  TextStyle lerp(double t, TextStyle from, TextStyle to) {
    return TextStyle.lerp(from, to, t)!;
  }
}
