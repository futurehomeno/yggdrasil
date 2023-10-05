import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

enum YgToggleButtonSize {
  small,
  medium,
  large;

  TextStyle buildTextStyle(YgToggleButtonTheme theme) {
    switch (this) {
      case YgToggleButtonSize.small:
        return theme.textStyleSmall;
      case YgToggleButtonSize.medium:
        return theme.textStyleMedium;
      case YgToggleButtonSize.large:
        return theme.textStyleLarge;
    }
  }
}
