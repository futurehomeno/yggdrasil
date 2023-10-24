import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef NullableDecoration = Decoration?;
typedef YgNullableDecorationProperty<T extends Enum> = YgProperty<T, Decoration?>;
typedef YgMaterialNullableDecorationProperty = YgMaterialProperty<Decoration?>;
typedef YgAnimatedNullableDecorationProperty = YgAnimatedProperty<Decoration?>;
typedef YgDrivenNullableDecorationProperty = YgDrivenProperty<Decoration?>;

class NullableDecorationTween extends Tween<Decoration?> {
  NullableDecorationTween({
    super.begin,
    super.end,
  });

  @override
  Decoration? lerp(double t) => Decoration.lerp(
        begin,
        end,
        t,
      );
}
