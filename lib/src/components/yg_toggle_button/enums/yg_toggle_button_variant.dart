import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'yg_toggle_button_size.dart';

/// Internal only. Do not export.
enum YgToggleButtonVariant {
  icon,
  text,
  iconAndText;

  EdgeInsets buildPadding(YgToggleButtonTheme theme, YgToggleButtonSize size) {
    switch (this) {
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
