import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAnimatedOffsetProperty<T extends Enum> extends YgAnimatedProperty<T, Offset> {
  YgAnimatedOffsetProperty.fromStyle(
    super.style,
    super.resolve,
  ) : super.fromStyle();

  @override
  Offset lerp(double t, Offset from, Offset to) {
    return Offset.lerp(from, to, t)!;
  }
}
