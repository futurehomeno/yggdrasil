part of yg_states;


typedef YgEdgeInsetsGeometryProperty<T extends YgState> = YgProperty<T, EdgeInsetsGeometry>;
typedef YgAnimatedEdgeInsetsGeometryProperty = YgAnimatedProperty<EdgeInsetsGeometry>;
typedef YgDrivenEdgeInsetsGeometryProperty = YgDrivenProperty<EdgeInsetsGeometry>;

class NonNullableEdgeInsetsGeometryTween extends Tween<EdgeInsetsGeometry> {
  NonNullableEdgeInsetsGeometryTween({
    required super.begin,
    required super.end,
  });

  @override
  EdgeInsetsGeometry lerp(double t) => EdgeInsetsGeometry.lerp(
        begin,
        end,
        t,
      )!;
}
