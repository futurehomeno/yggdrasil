import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef NullableFractionalOffset = FractionalOffset?;
typedef YgNullableFractionalOffsetProperty<T extends Enum> = YgProperty<T, FractionalOffset?>;
typedef YgMaterialNullableFractionalOffsetProperty = YgMaterialProperty<FractionalOffset?>;
typedef YgAnimatedNullableFractionalOffsetProperty = YgAnimatedProperty<FractionalOffset?>;
typedef YgDrivenNullableFractionalOffsetProperty = YgDrivenProperty<FractionalOffset?>;

class NullableFractionalOffsetTween extends Tween<FractionalOffset?> {
  NullableFractionalOffsetTween({
    super.begin,
    super.end,
  });

  @override
  FractionalOffset? lerp(double t) => FractionalOffset.lerp(
        begin,
        end,
        t,
      );
}
