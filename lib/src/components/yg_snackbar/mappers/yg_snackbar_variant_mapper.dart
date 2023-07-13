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
          icon: 'icon',
          size: YgIconSize.small,
          color: theme.highlightSnackbarTheme.iconColor,
        );
      case YgSnackbarVariant.success:
        return YgIcon(
          icon: 'icon',
          size: YgIconSize.small,
          color: theme.highlightSnackbarTheme.iconColor,
        );
      case YgSnackbarVariant.critical:
        return YgIcon(
          icon: 'icon',
          size: YgIconSize.small,
          color: theme.highlightSnackbarTheme.iconColor,
        );
    }
  }
}
