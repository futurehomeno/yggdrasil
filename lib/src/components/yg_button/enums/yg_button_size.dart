import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

enum ButtonSize {
  small,
  medium,
  large;

  EdgeInsets buildPadding(YgButtonTheme theme) {
    switch (this) {
      case ButtonSize.small:
        return theme.paddingSmall;
      case ButtonSize.medium:
        return theme.paddingMedium;
      case ButtonSize.large:
        return theme.paddingLarge;
    }
  }
}
