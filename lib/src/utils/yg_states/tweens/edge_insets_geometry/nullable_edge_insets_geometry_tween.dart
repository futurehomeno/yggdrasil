import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

typedef NullableEdgeInsetsGeometry = EdgeInsetsGeometry?;
typedef YgNullableEdgeInsetsGeometryProperty<T extends Enum> = YgProperty<T, EdgeInsetsGeometry?>;
typedef YgMaterialNullableEdgeInsetsGeometryProperty = YgMaterialProperty<EdgeInsetsGeometry?>;
typedef YgAnimatedNullableEdgeInsetsGeometryProperty = YgAnimatedProperty<EdgeInsetsGeometry?>;
typedef YgDrivenNullableEdgeInsetsGeometryProperty = YgDrivenProperty<EdgeInsetsGeometry?>;

class NullableEdgeInsetsGeometryTween extends Tween<EdgeInsetsGeometry?> {
  NullableEdgeInsetsGeometryTween({
    super.begin,
    super.end,
  });

  @override
  EdgeInsetsGeometry? lerp(double t) => EdgeInsetsGeometry.lerp(
        begin,
        end,
        t,
      );
}
