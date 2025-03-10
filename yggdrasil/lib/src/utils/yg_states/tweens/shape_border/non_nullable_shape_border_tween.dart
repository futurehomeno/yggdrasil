part of yg_states;


typedef YgShapeBorderProperty<T extends YgState> = YgProperty<T, ShapeBorder>;
typedef YgAnimatedShapeBorderProperty = YgAnimatedProperty<ShapeBorder>;
typedef YgDrivenShapeBorderProperty = YgDrivenProperty<ShapeBorder>;

class NonNullableShapeBorderTween extends Tween<ShapeBorder> {
  NonNullableShapeBorderTween({
    required super.begin,
    required super.end,
  });

  @override
  ShapeBorder lerp(double t) => ShapeBorder.lerp(
        begin,
        end,
        t,
      )!;
}
