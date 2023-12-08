import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_card/yg_card_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgCardStyle extends YgStyleWithDefaults<YgCardState> {
  YgCardStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedColorProperty backgroundColor;
  late final YgAnimatedShapeBorderProperty shape;
  late final YgAnimatedDoubleProperty elevation;

  @override
  void init() {
    backgroundColor = animate(YgColorProperty<YgCardState>.resolveWith(_resolveBackgroundColor));
    shape = animate(YgShapeBorderProperty<YgCardState>.resolveWith(_resolveShape));
    elevation = animate(YgDoubleProperty<YgCardState>.resolveWith(_resolveElevation));
  }

  Color _resolveBackgroundColor(BuildContext context, YgCardState state) {
    switch (state.variant.value) {
      case YgCardVariant.elevated:
        return _theme.elevatedCardTheme.backgroundColor;
      case YgCardVariant.filled:
        return _theme.filledCardTheme.backgroundColor;
      case YgCardVariant.outlined:
        return _theme.outlinedCardTheme.backgroundColor;
    }
  }

  ShapeBorder _resolveShape(BuildContext context, YgCardState state) {
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

  double _resolveElevation(BuildContext context, YgCardState state) {
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
