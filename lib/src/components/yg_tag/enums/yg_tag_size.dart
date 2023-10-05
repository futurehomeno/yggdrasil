import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

enum YgTagSize {
  small,
  medium;

  EdgeInsets buildPadding(YgTagTheme theme) {
    switch (this) {
      case YgTagSize.small:
        return theme.paddingSmall;
      case YgTagSize.medium:
        return theme.paddingMedium;
    }
  }
}
