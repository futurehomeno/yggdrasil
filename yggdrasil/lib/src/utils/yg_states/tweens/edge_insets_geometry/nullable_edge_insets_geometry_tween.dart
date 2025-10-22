import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

typedef YgNullableEdgeInsetsGeometryProperty<T extends YgState> = YgProperty<T, EdgeInsetsGeometry?>;
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
