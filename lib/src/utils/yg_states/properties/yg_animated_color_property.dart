import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAnimatedColorProperty<T extends Enum> extends YgAnimatedProperty<T, Color> {
  YgAnimatedColorProperty.fromStyle(
    super.style,
    super.resolve,
  ) : super.fromStyle();

  @override
  Color lerp(double t, Color from, Color to) {
    return Color.lerp(from, to, t)!;
  }
}
