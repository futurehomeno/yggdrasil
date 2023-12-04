import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/switch/switch_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_switch_state.dart';

class YgSwitchStyle extends YgStyleWithDefaults<YgSwitchState> {
  YgSwitchStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedColorProperty trackColor;
  late final YgAnimatedColorProperty handleColor;
  late final YgAnimatedDoubleProperty handlePositionFraction;
  late final YgDrivenDoubleProperty handleDiameter;
  late final YgDrivenDoubleProperty handlePadding;
  late final YgDrivenDoubleProperty width;
  late final YgDrivenProperty<MouseCursor> mouseCursor;

  @override
  void init() {
    handlePositionFraction = animate(YgDoubleProperty<YgSwitchState>.resolveWith(_resolveHandlePositionFraction));
    trackColor = animate(YgColorProperty<YgSwitchState>.resolveWith(_resolveTrackColor));
    handleColor = animate(YgColorProperty<YgSwitchState>.resolveWith(_resolveHandleColor));
    handlePadding = drive(YgDoubleProperty<YgSwitchState>.all(_resolveHandlePadding));
    handleDiameter = drive(YgDoubleProperty<YgSwitchState>.all(_resolveHandleDiameter));
    width = drive(YgDoubleProperty<YgSwitchState>.all(_resolveWidth));
    mouseCursor = drive(YgProperty<YgSwitchState, MouseCursor>.resolveWith(_resolveMouseCursor));
  }

  MouseCursor _resolveMouseCursor(BuildContext context, YgSwitchState state) {
    if (state.disabled.value) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  double _resolveHandlePadding(BuildContext context) {
    return _theme.handlePadding;
  }

  double _resolveHandleDiameter(BuildContext context) {
    return _theme.handleSize;
  }

  double _resolveWidth(BuildContext context) {
    return _theme.width;
  }

  double _resolveHandlePositionFraction(BuildContext context, YgSwitchState state) {
    if (state.toggled.value == true) {
      return 1;
    }

    if (state.toggled.value == false) {
      return 0;
    }

    return 0.5;
  }

  Color _resolveTrackColor(BuildContext context, YgSwitchState state) {
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

  Color _resolveHandleColor(BuildContext context, YgSwitchState state) {
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
