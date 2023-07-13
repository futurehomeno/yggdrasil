import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

enum YgCardVariant {
  elevated,
  filled,
  outlined;

  Color getBackgroundColor(YgCardTheme theme) {
    switch (this) {
      case YgCardVariant.elevated:
        return theme.elevatedCardTheme.backgroundColor;
      case YgCardVariant.filled:
        return theme.filledCardTheme.backgroundColor;
      case YgCardVariant.outlined:
        return theme.outlinedCardTheme.backgroundColor;
    }
  }

  ShapeBorder? getShape(YgCardTheme theme) {
    switch (this) {
      case YgCardVariant.elevated:
        return RoundedRectangleBorder(
          borderRadius: theme.borderRadius,
        );
      case YgCardVariant.filled:
        return RoundedRectangleBorder(
          borderRadius: theme.borderRadius,
        );
      case YgCardVariant.outlined:
        return RoundedRectangleBorder(
          borderRadius: theme.borderRadius,
          side: theme.outlinedCardTheme.borderSide,
        );
    }
  }

  double getElevation(YgCardTheme theme) {
    switch (this) {
      case YgCardVariant.elevated:
        return theme.elevation;
      case YgCardVariant.filled:
        return 0.0;
      case YgCardVariant.outlined:
        return 0.0;
    }
  }
}
