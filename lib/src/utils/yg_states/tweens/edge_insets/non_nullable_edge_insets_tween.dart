import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef YgEdgeInsetsProperty<T extends Enum> = YgProperty<T, EdgeInsets>;
typedef YgMaterialEdgeInsetsProperty = YgMaterialProperty<EdgeInsets>;
typedef YgAnimatedEdgeInsetsProperty = YgAnimatedProperty<EdgeInsets>;
typedef YgDrivenEdgeInsetsProperty = YgDrivenProperty<EdgeInsets>;

class NonNullableEdgeInsetsTween extends Tween<EdgeInsets> {
  NonNullableEdgeInsetsTween({
    required super.begin,
    required super.end,
  });

  @override
  EdgeInsets lerp(double t) => EdgeInsets.lerp(
        begin,
        end,
        t,
      )!;
}
