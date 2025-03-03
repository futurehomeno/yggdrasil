part of yg_states;


typedef YgRelativeRectProperty<T extends YgState> = YgProperty<T, RelativeRect>;
typedef YgAnimatedRelativeRectProperty = YgAnimatedProperty<RelativeRect>;
typedef YgDrivenRelativeRectProperty = YgDrivenProperty<RelativeRect>;

class NonNullableRelativeRectTween extends Tween<RelativeRect> {
  NonNullableRelativeRectTween({
    required super.begin,
    required super.end,
  });

  @override
  RelativeRect lerp(double t) => RelativeRect.lerp(
        begin,
        end,
        t,
      )!;
}
