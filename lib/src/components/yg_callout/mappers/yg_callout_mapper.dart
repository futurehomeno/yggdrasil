import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_callout/_yg_callout.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgCalloutMapper {
  const YgCalloutMapper._();

  static Color getBackgroundColor({
    required YgCalloutTheme theme,
    required YgCalloutVariant variant,
  }) {
    switch (variant) {
      case YgCalloutVariant.highlight:
        return theme.highlightCalloutTheme.backgroundColor;
      case YgCalloutVariant.success:
        return theme.successCalloutTheme.backgroundColor;
      case YgCalloutVariant.warning:
        return theme.warningCalloutTheme.backgroundColor;
      case YgCalloutVariant.critical:
        return theme.criticalCalloutTheme.backgroundColor;
    }
  }

  static Color getBorderColor({
    required YgCalloutTheme theme,
    required YgCalloutVariant variant,
  }) {
    switch (variant) {
      case YgCalloutVariant.highlight:
        return theme.highlightCalloutTheme.borderColor;
      case YgCalloutVariant.success:
        return theme.successCalloutTheme.borderColor;
      case YgCalloutVariant.warning:
        return theme.warningCalloutTheme.borderColor;
      case YgCalloutVariant.critical:
        return theme.criticalCalloutTheme.borderColor;
    }
  }
}
