import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

typedef YgCardState = YgVariantState<YgCardVariant>;

class YgCardStyle extends YgStyle<YgCardState> {
  YgCardStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Color> backgroundColor = animate(_resolveBackgroundColor);
  late final YgAnimatedProperty<ShapeBorder> shape = animate(_resolveShape);
  late final YgAnimatedProperty<double> elevation = animate(_resolveElevation);

  Color _resolveBackgroundColor() {
    switch (state.variant.value) {
      case YgCardVariant.elevated:
        return _theme.elevatedCardTheme.backgroundColor;
      case YgCardVariant.filled:
        return _theme.filledCardTheme.backgroundColor;
      case YgCardVariant.outlined:
        return _theme.outlinedCardTheme.backgroundColor;
    }
  }

  ShapeBorder _resolveShape() {
    switch (state.variant.value) {
      case YgCardVariant.elevated:
      case YgCardVariant.filled:
        return RoundedRectangleBorder(
          borderRadius: _theme.borderRadius,
        );
      case YgCardVariant.outlined:
        return RoundedRectangleBorder(
          borderRadius: _theme.borderRadius,
          side: _theme.outlinedCardTheme.borderSide,
        );
    }
  }

  double _resolveElevation() {
    switch (state.variant.value) {
      case YgCardVariant.elevated:
        return _theme.elevation;
      case YgCardVariant.filled:
      case YgCardVariant.outlined:
        return 0.0;
    }
  }

  YgCardTheme get _theme => context.cardTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}
