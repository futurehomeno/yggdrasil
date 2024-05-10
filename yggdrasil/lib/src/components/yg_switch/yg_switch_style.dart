import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/switch/switch_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_switch_state.dart';

class YgSwitchStyle extends YgStyle<YgSwitchState> {
  YgSwitchStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<double> handlePositionFraction = animate(_resolveHandlePositionFraction);
  late final YgAnimatedProperty<Color> trackColor = animate(_resolveTrackColor);
  late final YgAnimatedProperty<Color> handleColor = animate(_resolveHandleColor);
  late final YgDrivenProperty<MouseCursor> mouseCursor = drive(_resolveMouseCursor);
  late final YgDrivenProperty<double> handlePadding = all(_resolveHandlePadding);
  late final YgDrivenProperty<double> handleDiameter = all(_resolveHandleDiameter);
  late final YgDrivenProperty<double> width = all(_resolveWidth);

  MouseCursor _resolveMouseCursor() {
    if (state.disabled.value) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  double _resolveHandlePadding() {
    return _theme.handlePadding;
  }

  double _resolveHandleDiameter() {
    return _theme.handleSize;
  }

  double _resolveWidth() {
    return _theme.width;
  }

  double _resolveHandlePositionFraction() {
    if (state.toggled.value == true) {
      return 1;
    }

    if (state.toggled.value == false) {
      return 0;
    }

    return 0.5;
  }

  Color _resolveTrackColor() {
    if (state.disabled.value) {
      return _theme.trackDisabledColor;
    }

    if (state.toggled.value == true) {
      if (state.focused.value || state.hovered.value) {
        return _theme.trackToggledFocusedHoveredColor;
      }

      return _theme.trackToggledColor;
    }

    return _theme.trackDefaultColor;
  }

  Color _resolveHandleColor() {
    if (state.disabled.value) {
      return _theme.handleDisabledColor;
    }

    return _theme.handleDefaultColor;
  }

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;

  YgSwitchTheme get _theme => context.switchTheme;
}
