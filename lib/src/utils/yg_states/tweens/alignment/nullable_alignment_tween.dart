import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef NullableAlignment = Alignment?;
typedef YgNullableAlignmentProperty<T extends Enum> = YgProperty<T, Alignment?>;
typedef YgMaterialNullableAlignmentProperty = YgMaterialProperty<Alignment?>;
typedef YgAnimatedNullableAlignmentProperty = YgAnimatedProperty<Alignment?>;
typedef YgDrivenNullableAlignmentProperty = YgDrivenProperty<Alignment?>;

class NullableAlignmentTween extends Tween<Alignment?> {
  NullableAlignmentTween({
    super.begin,
    super.end,
  });

  @override
  Alignment? lerp(double t) => Alignment.lerp(
        begin,
        end,
        t,
      );
}
