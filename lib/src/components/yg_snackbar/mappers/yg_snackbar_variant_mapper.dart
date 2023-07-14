import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgSnackbarVariantMapper {
  const YgSnackbarVariantMapper._();

  static Color getContainerIconColor({
    required YgSnackbarTheme theme,
    required YgSnackbarVariant snackbarVariant,
  }) {
    switch (snackbarVariant) {
      case YgSnackbarVariant.highlight:
        return theme.highlightSnackbarTheme.iconContainerColor;
      case YgSnackbarVariant.success:
        return theme.successSnackbarTheme.iconContainerColor;
      case YgSnackbarVariant.critical:
        return theme.criticalSnackbarTheme.iconContainerColor;
    }
  }

  static Color getIconColor({
    required YgSnackbarTheme theme,
    required YgSnackbarVariant snackbarVariant,
  }) {
    switch (snackbarVariant) {
      case YgSnackbarVariant.highlight:
        return theme.highlightSnackbarTheme.iconColor;
      case YgSnackbarVariant.success:
        return theme.successSnackbarTheme.iconColor;
      case YgSnackbarVariant.critical:
        return theme.criticalSnackbarTheme.iconColor;
    }
  }

  static YgIcon getIcon({
    required YgSnackbarTheme theme,
    required YgSnackbarVariant snackbarVariant,
  }) {
    switch (snackbarVariant) {
      case YgSnackbarVariant.highlight:
        return YgIcon(
          YgIcons.info,
          size: YgIconSize.small,
          color: theme.highlightSnackbarTheme.iconColor,
        );
      case YgSnackbarVariant.success:
        return YgIcon(
          YgIcons.check,
          size: YgIconSize.small,
          color: theme.successSnackbarTheme.iconColor,
        );
      case YgSnackbarVariant.critical:
        return YgIcon(
          YgIcons.error,
          size: YgIconSize.small,
          color: theme.criticalSnackbarTheme.iconColor,
        );
    }
  }
}
