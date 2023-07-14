import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_badge/_yg_badge.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgBadgeMapper {
  const YgBadgeMapper._();

  static Color getBadgeColor({
    required YgBadgeTheme theme,
    required YgBadgeWeight weight,
  }) {
    switch (weight) {
      case YgBadgeWeight.weak:
        return theme.weakColor;
      case YgBadgeWeight.strong:
        return theme.strongColor;
    }
  }

  static TextStyle getTextStyle({
    required YgBadgeTheme theme,
    required YgBadgeWeight weight,
  }) {
    switch (weight) {
      case YgBadgeWeight.weak:
        return theme.weakTextStyle;
      case YgBadgeWeight.strong:
        return theme.strongTextStyle;
    }
  }
}
