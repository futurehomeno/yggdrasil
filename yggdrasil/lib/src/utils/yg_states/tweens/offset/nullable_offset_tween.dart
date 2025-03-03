part of yg_states;


typedef YgNullableOffsetProperty<T extends YgState> = YgProperty<T, Offset?>;
typedef YgAnimatedNullableOffsetProperty = YgAnimatedProperty<Offset?>;
typedef YgDrivenNullableOffsetProperty = YgDrivenProperty<Offset?>;

class NullableOffsetTween extends Tween<Offset?> {
  NullableOffsetTween({
    super.begin,
    super.end,
  });

  @override
  Offset? lerp(double t) => Offset.lerp(
        begin,
        end,
        t,
      );
}
