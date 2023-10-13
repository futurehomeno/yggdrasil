import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSnackBarMapper {
  const YgSnackBarMapper._();

  static Color getContainerIconColor({
    required YgSnackBarTheme theme,
    required YgSnackBarVariant snackBarVariant,
  }) {
    switch (snackBarVariant) {
      case YgSnackBarVariant.highlight:
        return theme.highlightSnackBarTheme.iconContainerColor;
      case YgSnackBarVariant.success:
        return theme.successSnackBarTheme.iconContainerColor;
      case YgSnackBarVariant.critical:
        return theme.criticalSnackBarTheme.iconContainerColor;
    }
  }

  static YgIcon getIcon({
    required YgSnackBarTheme theme,
    required YgSnackBarVariant snackBarVariant,
  }) {
    switch (snackBarVariant) {
      case YgSnackBarVariant.highlight:
        return YgIcon(
          YgIcons.info,
          size: YgIconSize.small,
          color: theme.highlightSnackBarTheme.iconColor,
        );
      case YgSnackBarVariant.success:
        return YgIcon(
          YgIcons.check,
          size: YgIconSize.small,
          color: theme.successSnackBarTheme.iconColor,
        );
      case YgSnackBarVariant.critical:
        return YgIcon(
          YgIcons.error,
          size: YgIconSize.small,
          color: theme.criticalSnackBarTheme.iconColor,
        );
    }
  }
}
