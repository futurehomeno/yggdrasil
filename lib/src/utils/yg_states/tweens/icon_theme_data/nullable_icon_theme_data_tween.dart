import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef NullableIconThemeData = IconThemeData?;
typedef YgNullableIconThemeDataProperty<T extends Enum> = YgProperty<T, IconThemeData?>;
typedef YgMaterialNullableIconThemeDataProperty = YgMaterialProperty<IconThemeData?>;
typedef YgAnimatedNullableIconThemeDataProperty = YgAnimatedProperty<IconThemeData?>;
typedef YgDrivenNullableIconThemeDataProperty = YgDrivenProperty<IconThemeData?>;

class NullableIconThemeDataTween extends Tween<IconThemeData?> {
  NullableIconThemeDataTween({
    super.begin,
    super.end,
  });

  @override
  IconThemeData lerp(double t) => IconThemeData.lerp(
        begin,
        end,
        t,
      );
}
