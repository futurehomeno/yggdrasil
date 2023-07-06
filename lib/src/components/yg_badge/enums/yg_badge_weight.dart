import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

enum YgBadgeWeight {
  weak,
  strong;

  Color getBadgeColor(YgBadgeThemes theme) {
    switch (this) {
      case YgBadgeWeight.weak:
        return theme.weakColor;
      case YgBadgeWeight.strong:
        return theme.strongColor;
    }
  }

  TextStyle getTextStyle(YgBadgeThemes theme) {
    switch (this) {
      case YgBadgeWeight.weak:
        return theme.weakTextStyle;
      case YgBadgeWeight.strong:
        return theme.strongTextStyle;
    }
  }
}
