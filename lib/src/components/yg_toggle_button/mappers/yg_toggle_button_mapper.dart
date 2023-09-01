import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_toggle_button/enums/_enums.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgToggleButtonMapper {
  const YgToggleButtonMapper._();

  static TextStyle buildTextStyle({
    required YgToggleButtonTheme theme,
    required YgToggleButtonSize size,
  }) {
    switch (size) {
      case YgToggleButtonSize.small:
        return theme.textStyleSmall;
      case YgToggleButtonSize.medium:
        return theme.textStyleMedium;
      case YgToggleButtonSize.large:
        return theme.textStyleLarge;
    }
  }

  static EdgeInsets buildPadding({
    required YgToggleButtonTheme theme,
    required YgToggleButtonSize size,
    required YgToggleButtonVariant variant,
  }) {
    switch (variant) {
      case YgToggleButtonVariant.icon:
        switch (size) {
          case YgToggleButtonSize.small:
            return theme.toggleIconButtonTheme.paddingSmall;
          case YgToggleButtonSize.medium:
            return theme.toggleIconButtonTheme.paddingMedium;
          case YgToggleButtonSize.large:
            return theme.toggleIconButtonTheme.paddingLarge;
        }

      case YgToggleButtonVariant.text:
        switch (size) {
          case YgToggleButtonSize.small:
            return theme.toggleTextButtonTheme.paddingSmall;
          case YgToggleButtonSize.medium:
            return theme.toggleTextButtonTheme.paddingMedium;
          case YgToggleButtonSize.large:
            return theme.toggleTextButtonTheme.paddingLarge;
        }

      case YgToggleButtonVariant.iconAndText:
        switch (size) {
          case YgToggleButtonSize.small:
            return theme.toggleIconTextButtonTheme.paddingSmall;
          case YgToggleButtonSize.medium:
            return theme.toggleIconTextButtonTheme.paddingMedium;
          case YgToggleButtonSize.large:
            return theme.toggleIconTextButtonTheme.paddingLarge;
        }
    }
  }
}
