part of yg_states;


typedef YgFractionalOffsetProperty<T extends YgState> = YgProperty<T, FractionalOffset>;
typedef YgAnimatedFractionalOffsetProperty = YgAnimatedProperty<FractionalOffset>;
typedef YgDrivenFractionalOffsetProperty = YgDrivenProperty<FractionalOffset>;

class NonNullableFractionalOffsetTween extends Tween<FractionalOffset> {
  NonNullableFractionalOffsetTween({
    required super.begin,
    required super.end,
  });

  @override
  FractionalOffset lerp(double t) => FractionalOffset.lerp(
        begin,
        end,
        t,
      )!;
}
