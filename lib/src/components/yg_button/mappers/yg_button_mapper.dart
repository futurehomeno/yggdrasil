import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_button/_yg_button.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgButtonMapper {
  const YgButtonMapper._();

  static EdgeInsets buildPadding({
    required YgButtonTheme theme,
    required ButtonSize size,
  }) {
    switch (size) {
      case ButtonSize.small:
        return theme.paddingSmall;
      case ButtonSize.medium:
        return theme.paddingMedium;
      case ButtonSize.large:
        return theme.paddingLarge;
    }
  }
}
