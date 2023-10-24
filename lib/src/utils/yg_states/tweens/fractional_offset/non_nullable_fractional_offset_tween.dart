import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef YgFractionalOffsetProperty<T extends Enum> = YgProperty<T, FractionalOffset>;
typedef YgMaterialFractionalOffsetProperty = YgMaterialProperty<FractionalOffset>;
typedef YgAnimatedFractionalOffsetProperty = YgAnimatedProperty<FractionalOffset>;
typedef YgDrivenFractionalOffsetProperty = YgDrivenProperty<FractionalOffset>;

class NonNullableFractionalOffsetTween extends Tween<FractionalOffset> {
  NonNullableFractionalOffsetTween({
    required super.begin,
    required super.end,
  });

  @override
  FractionalOffset lerp(double t) => FractionalOffset.lerp(
        begin,
        end,
        t,
      )!;
}
