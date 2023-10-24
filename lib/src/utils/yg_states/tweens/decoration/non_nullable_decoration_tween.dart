import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef YgDecorationProperty<T extends Enum> = YgProperty<T, Decoration>;
typedef YgMaterialDecorationProperty = YgMaterialProperty<Decoration>;
typedef YgAnimatedDecorationProperty = YgAnimatedProperty<Decoration>;
typedef YgDrivenDecorationProperty = YgDrivenProperty<Decoration>;

class NonNullableDecorationTween extends Tween<Decoration> {
  NonNullableDecorationTween({
    required super.begin,
    required super.end,
  });

  @override
  Decoration lerp(double t) => Decoration.lerp(
        begin,
        end,
        t,
      )!;
}
