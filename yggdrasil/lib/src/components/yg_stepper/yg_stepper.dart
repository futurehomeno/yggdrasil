import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_stepper/yg_stepper_state.dart';
import 'package:yggdrasil/src/components/yg_stepper/yg_stepper_style.dart';
import 'package:yggdrasil/src/theme/stepper/stepper_theme.dart';
import 'package:yggdrasil/src/theme/theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

/// Implementation of the Stepper component
class YgStepper extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgStepper({
    super.key,
    required this.value,
    required this.onChanged,
    this.metric,
    this.precision,
    this.stepSize = 1,
    this.min = 0,
    this.max = 100,
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
  final ValueChanged<double>? onChanged;

  /// The optional metric shown under the value.
  final String? metric;

  /// The amount of decimals that will be shown for the value.
  ///
  /// If not provided the precision will be extracted from the [stepSize]
  /// instead.
  final int? precision;

  @override
  State<YgStepper> createState() => _YgStepperState();
}

class _YgStepperState extends StateWithYgStateAndStyle<YgStepper, YgStepperState, YgStepperStyle> {
  @override
  YgStepperState createState() {
    return YgStepperState(
      disabled: widget.onChanged == null,
    );
  }

  @override
  void updateState() {
    state.disabled.value = widget.onChanged == null;
  }

  @override
  YgStepperStyle createStyle() {
    return YgStepperStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final YgStepperTheme theme = context.stepperTheme;
    final bool canDecrease = widget.value > widget.min && !state.disabled.value;
    final bool canIncrease = widget.value < widget.max && !state.disabled.value;
    final String? metric = widget.metric;
    final String valueString = widget.value.toStringAsFixed(
      widget.precision ?? widget.stepSize.precision,
    );

    return SizedBox(
      height: theme.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          YgStepperButton(
            onPressed: _handleDecrease,
            disabled: !canDecrease,
            icon: YgIcons.minus,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DefaultTextStyleTransition(
                  style: style.valueStyle,
                  child: Text(
                    valueString,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (metric != null)
                  DefaultTextStyleTransition(
                    style: style.metricStyle,
                    child: Text(
                      metric,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
          YgStepperButton(
            onPressed: _handleIncrease,
            disabled: !canIncrease,
            icon: YgIcons.plus,
          ),
        ],
      ),
    );
  }

  void _handleIncrease() {
    widget.onChanged?.call(
      math.min(
        widget.max,
        widget.value + widget.stepSize,
      ),
    );
  }

  void _handleDecrease() {
    widget.onChanged?.call(
      math.max(
        widget.min,
        widget.value - widget.stepSize,
      ),
    );
  }
}