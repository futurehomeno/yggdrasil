import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_stepper/enums/_enums.dart';
import 'package:yggdrasil/src/components/yg_stepper/yg_stepper_state.dart';
import 'package:yggdrasil/src/theme/stepper/stepper_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgStepperStyle extends YgStyle<YgStepperState> {
  YgStepperStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<TextStyle> metricStyle = animate(_resolveMetricStyle);
  late final YgAnimatedProperty<TextStyle> valueStyle = animate(_resolveValueStyle);

  TextStyle _resolveMetricStyle() {
    final TextStyle textStyle = switch (state.size.value) {
      YgStepperSize.small => _theme.metricTextStyleSmall,
      YgStepperSize.medium => _theme.metricTextStyleMedium,
      YgStepperSize.large => _theme.metricTextStyleLarge,
    };

    return textStyle.copyWith(
      color: _resolveTextColor(state),
    );
  }

  TextStyle _resolveValueStyle() {
    final TextStyle textStyle = switch (state.size.value) {
      YgStepperSize.small => _theme.valueTextStyleSmall,
      YgStepperSize.medium => _theme.valueTextStyleMedium,
      YgStepperSize.large => _theme.valueTextStyleLarge,
    };

    return textStyle.copyWith(
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
