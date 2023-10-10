import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAnimatedBorderRadiusProperty<T extends Enum> extends YgAnimatedProperty<T, BorderRadius> {
  YgAnimatedBorderRadiusProperty.fromStyle(
    super.style,
    super.resolve,
  ) : super.fromStyle();

  @override
  BorderRadius lerp(double t, BorderRadius from, BorderRadius to) {
    return BorderRadius.lerp(from, to, t)!;
  }
}
