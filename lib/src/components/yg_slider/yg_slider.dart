import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_slider/enums/yg_slider_adjustment_type.dart';
import 'package:yggdrasil/src/components/yg_slider/value_indicator/yg_slider_value_indicator.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_style.dart';
import 'package:yggdrasil/src/theme/slider/slider_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'shortcuts/_shortcuts.dart';
import 'yg_slider_render_widget.dart';
import 'yg_slider_repeating_stepper_button.dart';

typedef YgSliderValueBuilder = String Function(double value)?;

/// Implementation of the Yggdrasil slider.
class YgSlider extends StatefulWidget with StatefulWidgetDebugMixin {
  const YgSlider({
    super.key,
    required this.value,
    this.min = 0,
    this.max = 1,
    this.stepSize,
    this.onChange,
    this.onEditingComplete,
    this.currentValue,
    this.focusNode,
    this.valueBuilder,
    this.stepper = false,
    this.autofocus = false,
    this.disabled = false,
    this.valueIndicator = false,
    this.differenceIndicator = false,
    this.variant = YgSliderVariant.temperature,
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

  /// Builds a value string from the current value for the value indicator.
  final YgSliderValueBuilder valueBuilder;

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

  /// Controls the focus of the widget.
  final FocusNode? focusNode;

  /// Whether the slider should focus on first build.
  final bool autofocus;

  /// Whether the slider field is disabled.
  ///
  /// Applies styling for the disabled slider field. Also disables all interaction.
  final bool disabled;

  @override
  State<YgSlider> createState() => YgSliderWidgetState();
}

class YgSliderWidgetState extends StateWithYgStateAndStyle<YgSlider, YgSliderState, YgSliderStyle>
    with YgControllerManagerMixin {
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
  );

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

  final Key _contentKey = GlobalKey();

  Timer? _recentEditTimer;
  late double _targetValue;
  late bool _canIncrease;
  late bool _canDecrease;
  final LayerLink _layerLink = LayerLink();

  @override
  YgSliderState createState() {
    return YgSliderState(
      variant: widget.variant,
      increasing: _increasing,
      staticDifferenceIndicatorIndicator: widget.currentValue != null,
      disabled: widget.disabled,
      differenceIndicatorEnabled: widget.differenceIndicator,
      valueIndicatorEnabled: widget.valueIndicator,
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
    state.increasing.value = _increasing;
    state.staticDifferenceIndicatorIndicator.value = widget.currentValue != null;
    state.disabled.value = widget.disabled;
    state.differenceIndicatorEnabled.value = widget.differenceIndicator;
    state.valueIndicatorEnabled.value = widget.valueIndicator;
  }

  @override
  void initState() {
    super.initState();
    _targetValue = widget.value;
    _canIncrease = _targetValue < widget.max;
    _canDecrease = _targetValue > widget.min;
    _currentValueController.addListener(_updateIncreasingState);
    _valueController.addListener(_updateIncreasingState);
  }

  void _updateIncreasingState() {
    state.increasing.value = _increasing;
  }

  bool get _increasing => widget.currentValue != null && _currentValueController.value < _valueController.value;

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
      // Can ignore this because isRebuilding is used to check if the setState is needed.
      // ignore: avoid-unnecessary-setstate
      _handleChange(
        widget.value,
        animated: true,
        isRebuilding: true,
      );
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _valueController.removeListener(_updateIncreasingState);
    _currentValueController.removeListener(_updateIncreasingState);
    _valueController.dispose();
    _currentValueController.dispose();
    _recentEditTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final YgSliderTheme theme = context.sliderTheme;

    Widget content = FocusableActionDetector(
      key: _contentKey,
      onShowHoverHighlight: state.hovered.update,
      onShowFocusHighlight: state.focused.update,
      shortcuts: YgSliderShortcuts.getNavShortcutMapForNavigationMode(
        MediaQuery.navigationModeOf(context),
      ),
      actions: <Type, Action<Intent>>{
        YgSliderAdjustmentIntent: CallbackAction<YgSliderAdjustmentIntent>(
          onInvoke: _handleAction,
        ),
      },
      mouseCursor: SystemMouseCursors.click,
      focusNode: _focusNodeManager.value,
      autofocus: widget.autofocus,
      enabled: !widget.disabled,
      child: RepaintBoundary(
        child: YgSliderRenderWidget(
          style: style,
          currentValue: _currentValueController,
          value: _valueController,
          onChange: _handleChange,
          editingChanged: _handleEditingChanged,
          state: state,
          layerLink: _layerLink,
          max: widget.max,
          min: widget.min,
          stepSize: widget.stepSize,
        ),
      ),
    );

    if (widget.stepper) {
      final double steps = (widget.max - widget.min) / _effectiveStepSize;
      final double intervalMs = 3000 / steps;
      final Duration interval = Duration(milliseconds: intervalMs.clamp(50, 300).round());

      content = Row(
        children: <Widget>[
          YgSliderRepeatingStepperButton(
            icon: YgIcons.minus,
            onTrigger: () => _stepValue(_targetValue - _effectiveStepSize),
            editingChanged: _handleEditingChanged,
            disabled: !_canDecrease,
            interval: interval,
          ),
          Expanded(child: content),
          YgSliderRepeatingStepperButton(
            icon: YgIcons.plus,
            disabled: !_canIncrease,
            onTrigger: () => _stepValue(_targetValue + _effectiveStepSize),
            editingChanged: _handleEditingChanged,
            interval: interval,
          ),
        ].withHorizontalSpacing(theme.stepperButtonsGap),
      );
    }

    return YgSliderValueIndicator(
      state: state,
      layerLink: _layerLink,
      value: _valueController,
      min: widget.min,
      max: widget.max,
      stepSize: widget.stepSize,
      valueBuilder: widget.valueBuilder,
      child: content,
    );
  }

  double get _effectiveStepSize => widget.stepSize ?? ((widget.max - widget.min) / 20);

  void _handleAction(YgSliderAdjustmentIntent intent) {
    switch (intent.type) {
      case YgSliderAdjustmentType.increase:
        _stepValue(_targetValue + _effectiveStepSize);
      case YgSliderAdjustmentType.decrease:
        _stepValue(_targetValue - _effectiveStepSize);
    }
  }

  void _stepValue(double step) {
    if (!state.editing.value) {
      state.recentlyEdited.value = true;
      _recentEditTimer?.cancel();
      _recentEditTimer = Timer(
        const Duration(seconds: 2),
        _handleRecentEditTimeout,
      );
    }

    _maybeUpdateCurrentValue();
    _handleChange(
      step,
      animated: true,
    );
  }

  void _handleChange(double newValue, {bool animated = false, bool isRebuilding = false}) {
    newValue = newValue.clamp(widget.min, widget.max);

    // Value hasn't changed.
    if (newValue == _targetValue) {
      return;
    }

    // Update the value controller.
    if (animated) {
      _valueController.animateTo(
        newValue,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    } else {
      _valueController.value = newValue;
    }

    // Update the value.
    _targetValue = newValue;

    // Update the stepper button values.
    final bool newCanIncrease = _targetValue < widget.max;
    final bool newCanDecrease = _targetValue > widget.min;
    if (newCanIncrease != _canIncrease || newCanDecrease != _canDecrease) {
      _canIncrease = newCanIncrease;
      _canDecrease = newCanDecrease;
      if (widget.stepper && !isRebuilding) {
        setState(() {});
      }
    }

    // We have to check this in case the change was triggered from the widget update.
    if (widget.value != newValue && !isRebuilding) {
      widget.onChange?.call(newValue);

      if (!state.editing.value) {
        widget.onEditingComplete?.call(newValue);
      }
    }
  }

  void _maybeUpdateCurrentValue() {
    if (widget.currentValue == null &&
        widget.differenceIndicator &&
        style.differenceIndicatorColor.value.opacity == 0.0) {
      _currentValueController.value = _valueController.value;
    }
  }

  void _handleEditingChanged(bool editing) {
    if (editing == state.editing.value) {
      return;
    }

    state.editing.value = editing;
    if (editing) {
      _recentEditTimer?.cancel();
      _updateIncreasingState();
      _maybeUpdateCurrentValue();
    } else {
      state.recentlyEdited.value = true;
      widget.onEditingComplete?.call(_targetValue);
      _recentEditTimer = Timer(
        const Duration(seconds: 2),
        _handleRecentEditTimeout,
      );
    }
  }

  void _handleRecentEditTimeout() {
    state.recentlyEdited.value = false;
    _recentEditTimer = null;

    // Move the difference indicator to the current value.
    if (widget.currentValue == null && widget.differenceIndicator) {
      _currentValueController.animateTo(
        _valueController.value,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }
}
