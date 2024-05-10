import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgBorderRadiusProperty<T extends YgState> = YgProperty<T, BorderRadius>;
typedef YgAnimatedBorderRadiusProperty = YgAnimatedProperty<BorderRadius>;
typedef YgDrivenBorderRadiusProperty = YgDrivenProperty<BorderRadius>;

class NonNullableBorderRadiusTween extends Tween<BorderRadius> {
  NonNullableBorderRadiusTween({
    required super.begin,
    required super.end,
  });

  @override
  BorderRadius lerp(double t) => BorderRadius.lerp(
        begin,
        end,
        t,
      )!;
}
