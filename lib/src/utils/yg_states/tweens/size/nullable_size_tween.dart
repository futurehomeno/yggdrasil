import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableSizeProperty<T extends Enum> = YgProperty<T, Size?>;
typedef YgMaterialNullableSizeProperty = YgMaterialProperty<Size?>;
typedef YgAnimatedNullableSizeProperty = YgAnimatedProperty<Size?>;
typedef YgDrivenNullableSizeProperty = YgDrivenProperty<Size?>;

class NullableSizeTween extends Tween<Size?> {
  NullableSizeTween({
    super.begin,
    super.end,
  });

  @override
  Size? lerp(double t) => Size.lerp(
        begin,
        end,
        t,
      );
}
