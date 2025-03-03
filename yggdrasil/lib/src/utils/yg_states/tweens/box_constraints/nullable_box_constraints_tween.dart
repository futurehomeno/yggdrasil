part of yg_states;


typedef YgNullableBoxConstraintsProperty<T extends YgState> = YgProperty<T, BoxConstraints?>;
typedef YgAnimatedNullableBoxConstraintsProperty = YgAnimatedProperty<BoxConstraints?>;
typedef YgDrivenNullableBoxConstraintsProperty = YgDrivenProperty<BoxConstraints?>;

class NullableBoxConstraintsTween extends Tween<BoxConstraints?> {
  NullableBoxConstraintsTween({
    super.begin,
    super.end,
  });

  @override
  BoxConstraints? lerp(double t) => BoxConstraints.lerp(
        begin,
        end,
        t,
      );
}
