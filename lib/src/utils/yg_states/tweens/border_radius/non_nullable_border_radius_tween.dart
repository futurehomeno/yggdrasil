import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef YgBorderRadiusProperty<T extends Enum> = YgProperty<T, BorderRadius>;
typedef YgMaterialBorderRadiusProperty = YgMaterialProperty<BorderRadius>;
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
