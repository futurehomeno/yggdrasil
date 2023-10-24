import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef NullableOffset = Offset?;
typedef YgNullableOffsetProperty<T extends Enum> = YgProperty<T, Offset?>;
typedef YgMaterialNullableOffsetProperty = YgMaterialProperty<Offset?>;
typedef YgAnimatedNullableOffsetProperty = YgAnimatedProperty<Offset?>;
typedef YgDrivenNullableOffsetProperty = YgDrivenProperty<Offset?>;

class NullableOffsetTween extends Tween<Offset?> {
  NullableOffsetTween({
    super.begin,
    super.end,
  });

  @override
  Offset? lerp(double t) => Offset.lerp(
        begin,
        end,
        t,
      );
}
