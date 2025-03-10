part of yg_states;


typedef YgNullableRelativeRectProperty<T extends YgState> = YgProperty<T, RelativeRect?>;
typedef YgAnimatedNullableRelativeRectProperty = YgAnimatedProperty<RelativeRect?>;
typedef YgDrivenNullableRelativeRectProperty = YgDrivenProperty<RelativeRect?>;

class NullableRelativeRectTween extends Tween<RelativeRect?> {
  NullableRelativeRectTween({
    super.begin,
    super.end,
  });

  @override
  RelativeRect? lerp(double t) => RelativeRect.lerp(
        begin,
        end,
        t,
      );
}
