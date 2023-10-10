import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAnimatedBorderProperty<T extends Enum> extends YgAnimatedProperty<T, Border> {
  YgAnimatedBorderProperty.fromStyle(
    super.style,
    super.resolve,
  ) : super.fromStyle();

  @override
  Border lerp(double t, Border from, Border to) {
    return Border.lerp(from, to, t)!;
  }
}
