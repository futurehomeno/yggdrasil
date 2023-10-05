import 'package:flutter/material.dart';
import 'package:yggdrasil/src/utils/yg_states/_yg_states.dart';

abstract class YgOffsetProperty<T extends Enum> extends YgStatesProperty<T, Offset> {
  const YgOffsetProperty();

  @override
  Offset lerp(double t, Offset from, Offset to) {
    return Offset.lerp(
      from,
      to,
      t,
    )!;
  }
}
