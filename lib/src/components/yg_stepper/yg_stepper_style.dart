import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_stepper/yg_stepper_state.dart';
import 'package:yggdrasil/src/theme/stepper/stepper_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgStepperStyle extends YgStyleWithDefaults<YgStepperState> {
  YgStepperStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedTextStyleProperty metricStyle;
  late final YgAnimatedTextStyleProperty valueStyle;

  @override
  void init() {
    metricStyle = animate(YgTextStyleProperty<YgStepperState>.resolveWith(_resolveMetricStyle));
    valueStyle = animate(YgTextStyleProperty<YgStepperState>.resolveWith(_resolveValueStyle));
  }

  TextStyle _resolveMetricStyle(BuildContext context, YgStepperState state) {
    return _theme.metricTextStyle.copyWith(
      color: _resolveTextColor(state),
    );
  }

  TextStyle _resolveValueStyle(BuildContext context, YgStepperState state) {
    return _theme.valueTextStyle.copyWith(
      color: _resolveTextColor(state),
    );
  }

  Color _resolveTextColor(YgStepperState state) {
    if (state.disabled.value) {
      return _theme.textDisabledColor;
    }

    return _theme.textDefaultColor;
  }

  YgStepperTheme get _theme => context.stepperTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}
