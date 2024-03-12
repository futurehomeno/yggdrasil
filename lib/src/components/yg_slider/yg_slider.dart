import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_slider/_yg_slider.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_style.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'enums/yg_slider_difference.dart';
import 'yg_slider_render_widget.dart';

/// Implementation of the Yggdrasil slider.
class YgSlider extends StatefulWidget {
  const YgSlider({
    super.key,
    required this.variant,
    required this.value,
    this.min = 0,
    this.max = 1,
    this.stepSize,
    this.onChange,
    this.onEditingComplete,
    this.stepper = false,
    this.currentValue,
    this.valueIndicator = false,
    this.differenceIndicator = false,
  });

  /// The value of the slider.
  final double value;

  /// The variant of the slider.
  final YgSliderVariant variant;

  /// The minimum value of the slider.
  final double min;

  /// The maximum value of the slider.
  final double max;

  /// Whether the slider should include buttons to change the value of the
  /// slider.
  final bool stepper;

  /// Whether to show a value indicator when changing the value.
  final bool valueIndicator;

  /// Whether to show a difference indicator when changing the value.
  ///
  /// If [currentValue] is supplied this value is ignored and the difference
  /// indicator instead shows the difference between the value of the slider and
  /// the [currentValue].
  final bool differenceIndicator;

  /// The size of the steps.
  ///
  /// Used by both the slider it self, determining the granularity of the value,
  /// and the optional stepper buttons.
  final double? stepSize;

  /// The current value of the slider.
  ///
  /// This is used to show a difference indicator in the slider which shows the
  /// difference between where the value is currently at and what the target
  /// value is. Eg. the current value is 18deg and the thermostat is set to 22.
  final double? currentValue;

  /// Called when the value is changed.
  ///
  /// Gets called every time the value changes. This may happen multiple times a
  /// second. If you only want to know the value when the user finishes moving
  /// the slider, use [onEditingComplete] instead.
  final ValueChanged<double>? onChange;

  /// Called when the user finishes modifying the value.
  final ValueChanged<double>? onEditingComplete;

  @override
  State<YgSlider> createState() => YgSliderWidgetState();
}

class YgSliderWidgetState extends StateWithYgStateAndStyle<YgSlider, YgSliderState, YgSliderStyle>
    with YgControllerManagerMixin {
  late final AnimationController _valueController = AnimationController.unbounded(
    vsync: this,
    value: _targetValue,
  );

  late final AnimationController _currentValueController = AnimationController.unbounded(
    vsync: this,
    value: widget.currentValue ?? 0,
    duration: const Duration(
      milliseconds: 200,
    ),
  );

  Timer? _indicatorHideTimer;
  late double _targetValue = widget.value;

  @override
  YgSliderState createState() {
    return YgSliderState(
      variant: widget.variant,
      difference: _getDifference(),
    );
  }

  @override
  YgSliderStyle createStyle() {
    return YgSliderStyle(
      state: state,
      vsync: this,
    );
  }

  @override
  void updateState() {
    state.variant.value = widget.variant;
  }

  @override
  void initState() {
    super.initState();
    _currentValueController.addListener(_updateDifferenceState);
    _valueController.addListener(_updateDifferenceState);
  }

  void _updateDifferenceState() {
    state.difference.value = _getDifference();
  }

  YgSliderDifference _getDifference() {
    if (_currentValueController.value < _valueController.value) {
      return YgSliderDifference.increasing;
    }

    return YgSliderDifference.decreasing;
  }

  @override
  void didUpdateWidget(covariant YgSlider oldWidget) {
    final double? newCurrentValue = widget.currentValue;
    final double? oldCurrentValue = oldWidget.currentValue;

    if (oldWidget.currentValue != widget.currentValue && newCurrentValue != null) {
      if (oldCurrentValue == null) {
        _currentValueController.value = newCurrentValue;
      } else {
        _currentValueController.animateTo(
          newCurrentValue,
          curve: Curves.easeInOut,
          duration: const Duration(seconds: 1),
        );
      }
    }

    // Don't allow the value to be changed if the user is editing it.
    if (widget.value != _targetValue && !state.editing.value) {
      _targetValue = widget.value;
      _valueController.animateTo(
        _targetValue,
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 1),
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _valueController.removeListener(_updateDifferenceState);
    _currentValueController.removeListener(_updateDifferenceState);
    _valueController.dispose();
    _currentValueController.dispose();
    _indicatorHideTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YgSliderRenderWidget(
      style: style,
      currentValue: _currentValueController,
      value: _valueController,
      onChange: _handleChange,
      editingChanged: _handleEditingChanged,
    );
  }

  void _handleChange(double newValue) {
    // Update difference indicator value.
    if (widget.currentValue == null &&
        widget.differenceIndicator &&
        style.differenceIndicatorColor.value == Colors.transparent) {
      _currentValueController.value = _valueController.value;
    }

    // Update the value.
    _targetValue = newValue;
    _valueController.value = newValue;

    /// Update the indicator timer.
    state.showIndicators.value = true;
    _indicatorHideTimer?.cancel();
    _indicatorHideTimer = Timer(
      const Duration(seconds: 2),
      _hideIndicator,
    );
  }

  void _hideIndicator() {
    state.showIndicators.value = false;
    _indicatorHideTimer = null;
  }

  void _handleEditingChanged(bool editing) {
    if (editing == state.editing.value) {
      return;
    }

    state.editing.value = editing;
    if (!editing) {
      widget.onEditingComplete?.call(_targetValue);
    }
  }
}
