import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef YgRelativeRectProperty<T extends Enum> = YgProperty<T, RelativeRect>;
typedef YgMaterialRelativeRectProperty = YgMaterialProperty<RelativeRect>;
typedef YgAnimatedRelativeRectProperty = YgAnimatedProperty<RelativeRect>;
typedef YgDrivenRelativeRectProperty = YgDrivenProperty<RelativeRect>;

class NonNullableRelativeRectTween extends Tween<RelativeRect> {
  NonNullableRelativeRectTween({
    required super.begin,
    required super.end,
  });

  @override
  RelativeRect lerp(double t) => RelativeRect.lerp(
        begin,
        end,
        t,
      )!;
}
