part of yg_states;


typedef YgNullableFractionalOffsetProperty<T extends YgState> = YgProperty<T, FractionalOffset?>;
typedef YgAnimatedNullableFractionalOffsetProperty = YgAnimatedProperty<FractionalOffset?>;
typedef YgDrivenNullableFractionalOffsetProperty = YgDrivenProperty<FractionalOffset?>;

class NullableFractionalOffsetTween extends Tween<FractionalOffset?> {
  NullableFractionalOffsetTween({
    super.begin,
    super.end,
  });

  @override
  FractionalOffset? lerp(double t) => FractionalOffset.lerp(
        begin,
        end,
        t,
      );
}
