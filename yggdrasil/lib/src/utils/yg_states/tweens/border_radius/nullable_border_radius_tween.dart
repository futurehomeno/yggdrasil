part of yg_states;


typedef YgNullableBorderRadiusProperty<T extends YgState> = YgProperty<T, BorderRadius?>;
typedef YgAnimatedNullableBorderRadiusProperty = YgAnimatedProperty<BorderRadius?>;
typedef YgDrivenNullableBorderRadiusProperty = YgDrivenProperty<BorderRadius?>;

class NullableBorderRadiusTween extends Tween<BorderRadius?> {
  NullableBorderRadiusTween({
    super.begin,
    super.end,
  });

  @override
  BorderRadius? lerp(double t) => BorderRadius.lerp(
        begin,
        end,
        t,
      );
}
