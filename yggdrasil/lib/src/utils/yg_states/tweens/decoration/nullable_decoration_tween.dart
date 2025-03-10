part of yg_states;


typedef YgNullableDecorationProperty<T extends YgState> = YgProperty<T, Decoration?>;
typedef YgAnimatedNullableDecorationProperty = YgAnimatedProperty<Decoration?>;
typedef YgDrivenNullableDecorationProperty = YgDrivenProperty<Decoration?>;

class NullableDecorationTween extends Tween<Decoration?> {
  NullableDecorationTween({
    super.begin,
    super.end,
  });

  @override
  Decoration? lerp(double t) => Decoration.lerp(
        begin,
        end,
        t,
      );
}
