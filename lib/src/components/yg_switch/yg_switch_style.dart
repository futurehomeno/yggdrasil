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

  late YgDrivenDoubleProperty handlePositionFraction;
  late YgDrivenDoubleProperty handleDiameter;
  late YgDrivenDoubleProperty handlePadding;

  late YgAnimatedColorProperty trackColor;
  late YgAnimatedColorProperty handleColor;
  late YgDrivenDoubleProperty width;

  @override
  void init() {
    handlePositionFraction = animate(YgDoubleProperty<YgSwitchState>.resolveWith(_resolveHandlePositionFraction));
    trackColor = animate(YgColorProperty<YgSwitchState>.resolveWith(_resolveTrackColor));
    handleColor = animate(YgColorProperty<YgSwitchState>.resolveWith(_resolveHandleColor));
    handlePadding = drive(YgDoubleProperty<YgSwitchState>.all(_resolveHandlePadding));
    handleDiameter = drive(YgDoubleProperty<YgSwitchState>.all(_resolveHandleDiameter));
    width = drive(YgDoubleProperty<YgSwitchState>.all(_resolveWidth));
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
    if (state.selected.value == true) {
      return 1;
    }

    if (state.selected.value == false) {
      return 0;
    }

    return 0.5;
  }

  Color _resolveTrackColor(BuildContext context, YgSwitchState state) {
    if (state.disabled.value) {
      return _theme.trackDisabledColor;
    }

    if (state.selected.value == true) {
      return _theme.trackToggledColor;
    }

    if (state.selected.value == false) {
      return _theme.trackNotToggledColor;
    }

    return _theme.trackUnsetColor;
  }

  Color _resolveHandleColor(BuildContext context, YgSwitchState state) {
    if (state.disabled.value) {
      return _theme.handleDisabledColor;
    }

    if (state.selected.value == true) {
      return _theme.handleToggledColor;
    }

    if (state.selected.value == false) {
      return _theme.handleNotToggledColor;
    }

    return _theme.handleNullColor;
  }

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;

  YgSwitchTheme get _theme => context.switchTheme;
}
