part of yg_states;


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
