import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

enum ButtonSize {
  small,
  medium,
  large;

  EdgeInsets buildPadding(BuildContext context) {
    switch (this) {
      case ButtonSize.small:
        return context.buttonThemes.paddingSmall;
      case ButtonSize.medium:
        return context.buttonThemes.paddingMedium;
      case ButtonSize.large:
        return context.buttonThemes.paddingLarge;
    }
  }
}
