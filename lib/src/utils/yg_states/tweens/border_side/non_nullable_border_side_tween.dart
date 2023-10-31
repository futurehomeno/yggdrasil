import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgBorderSideProperty<T extends Enum> = YgProperty<T, BorderSide>;
typedef YgMaterialBorderSideProperty = YgMaterialProperty<BorderSide>;
typedef YgAnimatedBorderSideProperty = YgAnimatedProperty<BorderSide>;
typedef YgDrivenBorderSideProperty = YgDrivenProperty<BorderSide>;

class NonNullableBorderSideTween extends Tween<BorderSide> {
  NonNullableBorderSideTween({
    required super.begin,
    required super.end,
  });

  @override
  BorderSide lerp(double t) => BorderSide.lerp(
        begin!,
        end!,
        t,
      );
}
