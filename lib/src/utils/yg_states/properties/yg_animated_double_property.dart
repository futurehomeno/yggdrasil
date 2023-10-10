import 'dart:ui';

import 'package:yggdrasil/yggdrasil.dart';

class YgAnimatedDoubleProperty<T extends Enum> extends YgAnimatedProperty<T, double> {
  YgAnimatedDoubleProperty.fromStyle(
    super.style,
    super.resolve,
  ) : super.fromStyle();

  @override
  double lerp(double t, double from, double to) {
    return lerpDouble(from, to, t)!;
  }
}
