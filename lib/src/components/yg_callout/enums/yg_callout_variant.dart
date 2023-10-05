import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

enum YgCalloutVariant {
  highlight,
  success,
  warning,
  critical;

  Color getBackgroundColor(YgCalloutTheme theme) {
    switch (this) {
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

  Color getBorderColor(YgCalloutTheme theme) {
    switch (this) {
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
