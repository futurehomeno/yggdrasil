import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAnimatedSizeProperty<T extends Enum> extends YgAnimatedProperty<T, Size> {
  YgAnimatedSizeProperty.fromStyle(
    super.style,
    super.resolve,
  ) : super.fromStyle();

  @override
  Size lerp(double t, Size from, Size to) {
    return Size.lerp(from, to, t)!;
  }
}
