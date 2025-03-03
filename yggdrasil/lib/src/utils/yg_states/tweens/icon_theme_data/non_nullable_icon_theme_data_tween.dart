part of yg_states;


typedef YgIconThemeDataProperty<T extends YgState> = YgProperty<T, IconThemeData>;
typedef YgAnimatedIconThemeDataProperty = YgAnimatedProperty<IconThemeData>;
typedef YgDrivenIconThemeDataProperty = YgDrivenProperty<IconThemeData>;

class NonNullableIconThemeDataTween extends Tween<IconThemeData> {
  NonNullableIconThemeDataTween({
    required super.begin,
    required super.end,
  });

  @override
  IconThemeData lerp(double t) => IconThemeData.lerp(
        begin,
        end,
        t,
      );
}
