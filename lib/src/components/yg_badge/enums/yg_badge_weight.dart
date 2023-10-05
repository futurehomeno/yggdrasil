import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

enum YgBadgeWeight {
  weak,
  strong;

  Color getBadgeColor(YgBadgeTheme theme) {
    switch (this) {
      case YgBadgeWeight.weak:
        return theme.weakColor;
      case YgBadgeWeight.strong:
        return theme.strongColor;
    }
  }

  TextStyle getTextStyle(YgBadgeTheme theme) {
    switch (this) {
      case YgBadgeWeight.weak:
        return theme.weakTextStyle;
      case YgBadgeWeight.strong:
        return theme.strongTextStyle;
    }
  }
}
