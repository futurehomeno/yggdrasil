import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_card/_yg_card.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgCardMapper {
  const YgCardMapper._();

  static Color getBackgroundColor({
    required YgCardTheme theme,
    required YgCardVariant variant,
  }) {
    switch (variant) {
      case YgCardVariant.elevated:
        return theme.elevatedCardTheme.backgroundColor;
      case YgCardVariant.filled:
        return theme.filledCardTheme.backgroundColor;
      case YgCardVariant.outlined:
        return theme.outlinedCardTheme.backgroundColor;
    }
  }

  static ShapeBorder getShape({
    required YgCardTheme theme,
    required YgCardVariant variant,
  }) {
    switch (variant) {
      case YgCardVariant.elevated:
        return RoundedRectangleBorder(
          borderRadius: theme.borderRadius,
        );
      // ignore: no-equal-switch-case
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

  static double getElevation({
    required YgCardTheme theme,
    required YgCardVariant variant,
  }) {
    switch (variant) {
      case YgCardVariant.elevated:
        return theme.elevation;
      case YgCardVariant.filled:
        return 0.0;
      // ignore: no-equal-switch-case
      case YgCardVariant.outlined:
        return 0.0;
    }
  }
}
