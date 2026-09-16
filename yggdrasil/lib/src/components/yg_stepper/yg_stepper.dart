import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/yg_stepper_button/_yg_stepper_button.dart';
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
    this.size = YgStepperSize.large,
    this.variant = YgStepperVariant.outlined,
    this.colorForPlus,
    this.colorForMinus,
  }) : assert(
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

  /// The size of the stepper.
  ///
  /// For specific info see [YgStepperSize].
  final YgStepperSize size;

  /// The variant of the stepper.
  ///
  /// For specific info see [YgStepperVariant].
  final YgStepperVariant variant;

  /// Optional color override for the add button.
  ///
  /// Replaces the outline and icon color for [YgStepperVariant.outlined] and
  /// the background color for [YgStepperVariant.filled]. Ignored when the
  /// button is disabled.
  final Color? colorForPlus;

  /// Optional color override for the minus button.
  ///
  /// Replaces the outline and icon color for [YgStepperVariant.outlined] and
  /// the background color for [YgStepperVariant.filled]. Ignored when the
  /// button is disabled.
  final Color? colorForMinus;

  @override
  State<YgStepper> createState() => _YgStepperState();
}

class _YgStepperState extends StateWithYgStateAndStyle<YgStepper, YgStepperState, YgStepperStyle> {
  @override
  YgStepperState createState() {
    return YgStepperState(
      disabled: widget.onChanged == null,
      size: widget.size,
    );
  }

  @override
  void updateState() {
    state.disabled.value = widget.onChanged == null;
    state.size.value = widget.size;
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

    final double height = switch (widget.size) {
      YgStepperSize.small => theme.heightSmall,
      YgStepperSize.medium => theme.heightMedium,
      YgStepperSize.large => theme.heightLarge,
    };

    return SizedBox(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          YgStepperButton(
            onPressed: _handleDecrease,
            disabled: !canDecrease,
            icon: YgIcons.minus,
            size: _buttonSize,
            variant: _buttonVariant,
            color: widget.colorForMinus,
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
            size: _buttonSize,
            variant: _buttonVariant,
            color: widget.colorForPlus,
          ),
        ],
      ),
    );
  }

  YgStepperButtonSize get _buttonSize {
    switch (widget.size) {
      case YgStepperSize.small:
        return YgStepperButtonSize.small;
      case YgStepperSize.medium:
        return YgStepperButtonSize.medium;
      case YgStepperSize.large:
        return YgStepperButtonSize.large;
    }
  }

  YgStepperButtonVariant get _buttonVariant {
    switch (widget.variant) {
      case YgStepperVariant.outlined:
        return YgStepperButtonVariant.outlined;
      case YgStepperVariant.filled:
        return YgStepperButtonVariant.filled;
    }
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
