import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

enum YgButtonSize {
  small,
  medium,
  large;

  EdgeInsets buildPadding(YgButtonTheme theme) {
    switch (this) {
      case YgButtonSize.small:
        return theme.paddingSmall;
      case YgButtonSize.medium:
        return theme.paddingMedium;
      case YgButtonSize.large:
        return theme.paddingLarge;
    }
  }
}
