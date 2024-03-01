import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_callout/yg_callout_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '_yg_callout.dart';

class YgCalloutStyle extends YgStyleWithDefaults<YgCalloutState> {
  YgCalloutStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Color> backgroundColor = animate(_resolveBackgroundColor);
  late final YgAnimatedProperty<Color> borderColor = animate(_resolveBorderColor);

  Color _resolveBackgroundColor() {
    switch (state.variant.value) {
      case YgCalloutVariant.highlight:
        return _theme.highlightCalloutTheme.backgroundColor;
      case YgCalloutVariant.success:
        return _theme.successCalloutTheme.backgroundColor;
      case YgCalloutVariant.warning:
        return _theme.warningCalloutTheme.backgroundColor;
      case YgCalloutVariant.critical:
        return _theme.criticalCalloutTheme.backgroundColor;
    }
  }

  Color _resolveBorderColor() {
    switch (state.variant.value) {
      case YgCalloutVariant.highlight:
        return _theme.highlightCalloutTheme.borderColor;
      case YgCalloutVariant.success:
        return _theme.successCalloutTheme.borderColor;
      case YgCalloutVariant.warning:
        return _theme.warningCalloutTheme.borderColor;
      case YgCalloutVariant.critical:
        return _theme.criticalCalloutTheme.borderColor;
    }
  }

  YgCalloutTheme get _theme => context.calloutTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}
