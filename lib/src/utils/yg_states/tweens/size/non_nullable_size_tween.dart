import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgSizeProperty<T extends Enum> = YgProperty<T, Size>;
typedef YgMaterialSizeProperty = YgMaterialProperty<Size>;
typedef YgAnimatedSizeProperty = YgAnimatedProperty<Size>;
typedef YgDrivenSizeProperty = YgDrivenProperty<Size>;

class NonNullableSizeTween extends Tween<Size> {
  NonNullableSizeTween({
    required super.begin,
    required super.end,
  });

  @override
  Size lerp(double t) => Size.lerp(
        begin,
        end,
        t,
      )!;
}
