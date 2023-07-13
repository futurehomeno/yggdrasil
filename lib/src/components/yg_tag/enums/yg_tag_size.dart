import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

enum YgTagSize {
  small,
  medium;

  EdgeInsets buildPadding(BuildContext context) {
    switch (this) {
      case YgTagSize.small:
        return context.tagTheme.paddingSmall;
      case YgTagSize.medium:
        return context.tagTheme.paddingMedium;
    }
  }
}
