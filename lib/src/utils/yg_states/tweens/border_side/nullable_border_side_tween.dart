import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef NullableBorderSide = BorderSide?;
typedef YgNullableBorderSideProperty<T extends Enum> = YgProperty<T, BorderSide?>;
typedef YgMaterialNullableBorderSideProperty = YgMaterialProperty<BorderSide?>;
typedef YgAnimatedNullableBorderSideProperty = YgAnimatedProperty<BorderSide?>;
typedef YgDrivenNullableBorderSideProperty = YgDrivenProperty<BorderSide?>;

class NullableBorderSideTween extends Tween<BorderSide?> {
  NullableBorderSideTween({
    super.begin,
    super.end,
  });

  @override
  BorderSide? lerp(double t) {
    final BorderSide? begin = this.begin;
    final BorderSide? end = this.end;

    if (identical(begin, end)) {
      return begin;
    }
    if (begin == null) {
      return end!.scale(t);
    }
    if (end == null) {
      return begin.scale(1.0 - t);
    }

    return BorderSide.lerp(
      begin,
      end,
      t,
    );
  }
}
