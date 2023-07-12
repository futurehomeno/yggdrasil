import 'package:flutter/material.dart';
import 'package:yggdrasil/yggdrasil.dart';

enum YgCardVariant {
  elevated,
  filled,
  outlined;

  Color getBackgroundColor(YgCardTheme theme) {
    switch (this) {
      case YgCardVariant.elevated:
        return theme.elevatedBackgroundColor;
      case YgCardVariant.filled:
        return theme.filledBackgroundColor;
      case YgCardVariant.outlined:
        return theme.outlinedBackgroundColor;
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
          side: BorderSide(
            color: theme.outlinedBorderColor,
            width: 1,
          ),
        );
    }
  }

  double getElevation(YgCardTheme theme) {
    switch (this) {
      case YgCardVariant.elevated:
        return 1.0;
      case YgCardVariant.filled:
        return 0.0;
      case YgCardVariant.outlined:
        return 0.0;
    }
  }
}
