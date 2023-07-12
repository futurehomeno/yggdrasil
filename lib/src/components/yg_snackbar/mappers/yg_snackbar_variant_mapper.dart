import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_snackbar/enums/_enums.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgSnackbarVariantMapper {
  const YgSnackbarVariantMapper._();

  static Color getContainerIconColor({
    required YgSnackbarThemes theme,
    required YgSnackbarVariant snackbarVariant,
  }) {
    switch (snackbarVariant) {
      case YgSnackbarVariant.highlight:
        return theme.highlightSnackbarTheme.containerIconColor;
      case YgSnackbarVariant.success:
        return theme.successSnackbarTheme.containerIconColor;
      case YgSnackbarVariant.critical:
        return theme.criticalSnackbarTheme.containerIconColor;
    }
  }

  static Color getIconColor({
    required YgSnackbarThemes theme,
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

  // TODO(emeban): convert this to YgIcon whenever possible
  static Icon getIcon({
    required YgSnackbarThemes theme,
    required YgSnackbarVariant snackbarVariant,
  }) {
    switch (snackbarVariant) {
      case YgSnackbarVariant.highlight:
        return Icon(
          Icons.info_outline,
          color: theme.highlightSnackbarTheme.iconColor,
        );
      case YgSnackbarVariant.success:
        return Icon(
          Icons.check,
          color: theme.successSnackbarTheme.iconColor,
        );
      case YgSnackbarVariant.critical:
        return Icon(
          Icons.warning_amber_outlined,
          color: theme.criticalSnackbarTheme.iconColor,
        );
    }
  }
}
