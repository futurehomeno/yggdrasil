part of yg_states;


typedef YgNullableRectProperty<T extends YgState> = YgProperty<T, Rect?>;
typedef YgAnimatedNullableRectProperty = YgAnimatedProperty<Rect?>;
typedef YgDrivenNullableRectProperty = YgDrivenProperty<Rect?>;

class NullableRectTween extends Tween<Rect?> {
  NullableRectTween({
    super.begin,
    super.end,
  });

  @override
  Rect? lerp(double t) => Rect.lerp(
        begin,
        end,
        t,
      );
}
