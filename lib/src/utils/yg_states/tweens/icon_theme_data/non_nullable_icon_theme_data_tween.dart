import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgIconThemeDataProperty<T extends Enum> = YgProperty<T, IconThemeData>;
typedef YgMaterialIconThemeDataProperty = YgMaterialProperty<IconThemeData>;
typedef YgAnimatedIconThemeDataProperty = YgAnimatedProperty<IconThemeData>;
typedef YgDrivenIconThemeDataProperty = YgDrivenProperty<IconThemeData>;

class NonNullableIconThemeDataTween extends Tween<IconThemeData> {
  NonNullableIconThemeDataTween({
    required super.begin,
    required super.end,
  });

  @override
  IconThemeData lerp(double t) => IconThemeData.lerp(
        begin,
        end,
        t,
      );
}
