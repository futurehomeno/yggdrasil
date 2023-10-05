import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

abstract class YgColorProperty<T extends Enum> extends YgStatesProperty<T, Color> {
  const YgColorProperty();

  @override
  Color lerp(double t, Color from, Color to) {
    return Color.lerp(
      from,
      to,
      t,
    )!;
  }
}
