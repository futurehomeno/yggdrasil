import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_button/_yg_button.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgButtonMapper {
  const YgButtonMapper._();

  static EdgeInsets buildPadding({
    required YgButtonTheme theme,
    required YgButtonSize size,
  }) {
    switch (size) {
      case YgButtonSize.small:
        return theme.paddingSmall;
      case YgButtonSize.medium:
        return theme.paddingMedium;
      case YgButtonSize.large:
        return theme.paddingLarge;
    }
  }
}
