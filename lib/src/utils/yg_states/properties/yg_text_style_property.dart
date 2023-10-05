import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

abstract class YgTextStyleProperty<T extends Enum> extends YgStatesProperty<T, TextStyle> {
  const YgTextStyleProperty();

  @override
  TextStyle lerp(double t, TextStyle from, TextStyle to) {
    return TextStyle.lerp(
      from,
      to,
      t,
    )!;
  }
}
