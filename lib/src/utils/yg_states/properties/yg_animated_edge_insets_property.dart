import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgAnimatedEdgeInsetsProperty<T extends Enum> extends YgAnimatedProperty<T, EdgeInsets> {
  YgAnimatedEdgeInsetsProperty.fromStyle(
    super.style,
    super.resolve,
  ) : super.fromStyle();

  @override
  EdgeInsets lerp(double t, EdgeInsets from, EdgeInsets to) {
    return EdgeInsets.lerp(from, to, t)!;
  }
}
