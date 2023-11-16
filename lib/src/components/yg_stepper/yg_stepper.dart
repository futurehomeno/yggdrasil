import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/yg_stepper_button/_yg_stepper_button.dart';
import 'package:yggdrasil/src/theme/stepper/stepper_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgStepper extends StatelessWidget with StatelessWidgetDebugMixin {
  const YgStepper({
    super.key,
    required this.value,
    required this.onChange,
    this.stepSize = 1,
    this.min = 0,
    this.max = 100,
    this.metric,
    this.precision,
  })  : assert(
          stepSize > 0,
          'step size has to be more than 0',
        ),
        assert(
          max > min,
          'max has to be more than min',
        ),
        assert(
          value >= min && value <= max,
          'value has to be between min and max',
        ),
        assert(
          precision == null || precision >= 0,
          'precision can not be smaller than 0',
        );

  /// The minimum value.
  ///
  /// If value is equal to this value the minus button will be disabled.
  final double min;

  /// The maximum value.
  ///
  /// If value is equal to this value the add button will be disabled.
  final double max;

  /// The current value.
  final double value;

  /// The step size.
  ///
  /// This is the size the value will be increased / decreased by when clicking
  /// the add or minus button.
  ///
  /// Also determines the precision of the value if [precision] is not provided.
  final double stepSize;

  /// Called with the new value when the user interacts with the stepper.
  final ValueChanged<double> onChange;

  /// The optional metric shown under the value.
  final String? metric;

  /// The precision of the value.
  ///
  /// If not provided the precision will be extracted from the [stepSize]
  /// instead.
  final int? precision;

  @override
  Widget build(BuildContext context) {
    final YgStepperTheme theme = context.stepperTheme;
    final String? metric = this.metric;
    final String valueString = value.toStringAsFixed(
      precision ?? stepSize.precision,
    );

    return Row(
      children: <Widget>[
        YgStepperButton(
          onPressed: _handleDecrease,
          disabled: value <= min,
          child: const YgIcon(
            YgIcons.minus,
          ),
        ),
        Expanded(
          child: Padding(
            padding: theme.contentPadding,
            child: Column(
              children: <Widget>[
                Text(
                  valueString,
                  style: theme.valueTextStyle,
                ),
                if (metric != null)
                  Text(
                    metric,
                    style: theme.metricTextStyle,
                  ),
              ],
            ),
          ),
        ),
        YgStepperButton(
          onPressed: _handleIncrease,
          disabled: value >= max,
          child: const YgIcon(
            YgIcons.plus,
          ),
        ),
      ],
    );
  }

  void _handleIncrease() {
    onChange(
      math.min(
        max,
        value + stepSize,
      ),
    );
  }

  void _handleDecrease() {
    onChange(
      math.max(
        min,
        value - stepSize,
      ),
    );
  }
}
