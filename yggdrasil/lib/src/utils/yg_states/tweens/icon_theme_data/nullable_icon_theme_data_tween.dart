part of yg_states;


typedef YgNullableIconThemeDataProperty<T extends YgState> = YgProperty<T, IconThemeData?>;
typedef YgAnimatedNullableIconThemeDataProperty = YgAnimatedProperty<IconThemeData?>;
typedef YgDrivenNullableIconThemeDataProperty = YgDrivenProperty<IconThemeData?>;

class NullableIconThemeDataTween extends Tween<IconThemeData?> {
  NullableIconThemeDataTween({
    super.begin,
    super.end,
  });

  @override
  IconThemeData lerp(double t) => IconThemeData.lerp(
        begin,
        end,
        t,
      );
}
