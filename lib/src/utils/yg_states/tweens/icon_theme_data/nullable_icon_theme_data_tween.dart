import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

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
