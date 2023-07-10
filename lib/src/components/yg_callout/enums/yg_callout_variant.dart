import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

enum YgCalloutVariant {
  highlight,
  success,
  warning,
  critical;

  Color getBackgroundColor(YgCalloutThemes theme) {
    switch (this) {
      case YgCalloutVariant.highlight:
        return theme.highlightBackgroundColor;
      case YgCalloutVariant.success:
        return theme.successBackgroundColor;
      case YgCalloutVariant.warning:
        return theme.warningBackgroundColor;
      case YgCalloutVariant.critical:
        return theme.criticalBackgroundColor;
    }
  }

  Color getBorderColor(YgCalloutThemes theme) {
    switch (this) {
      case YgCalloutVariant.highlight:
        return theme.highlightBorderColor;
      case YgCalloutVariant.success:
        return theme.successBorderColor;
      case YgCalloutVariant.warning:
        return theme.warningBorderColor;
      case YgCalloutVariant.critical:
        return theme.criticalBorderColor;
    }
  }
}
