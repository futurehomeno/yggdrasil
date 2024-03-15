import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/yg_stepper_button/_yg_stepper_button.dart';
import 'package:yggdrasil/src/components/yg_slider/value_indicator/yg_slider_value_indicator.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_style.dart';
import 'package:yggdrasil/src/theme/slider/slider_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'shortcuts/_shortcuts.dart';
import 'yg_slider_render_widget.dart';

/// Implementation of the Yggdrasil slider.
class YgSlider extends StatefulWidget {
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
  late double _targetValue = widget.value;
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
      _handleChange(widget.value, animated: true);
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
        ),
      ),
    );

    if (widget.stepper) {
      content = Row(
        children: <Widget>[
          YgStepperButton(
            icon: YgIcons.minus,
            size: YgStepperButtonSize.medium,
            onPressed: () => _stepValue(_targetValue - _effectiveStepSize),
          ),
          Expanded(child: content),
          YgStepperButton(
            icon: YgIcons.plus,
            size: YgStepperButtonSize.medium,
            onPressed: () => _stepValue(_targetValue + _effectiveStepSize),
          ),
        ].withHorizontalSpacing(theme.stepperButtonsGap),
      );
    }

    return YgSliderValueIndicator(
      state: state,
      layerLink: _layerLink,
      value: _valueController,
      child: content,
    );
  }

  double get _effectiveStepSize => widget.stepSize ?? ((widget.max - widget.min) / 20);

  void _handleAction(YgSliderAdjustmentIntent intent) {
    switch (intent) {
      case YgSliderAdjustmentIncreaseIntent():
        _stepValue(_targetValue + _effectiveStepSize);
      case YgSliderAdjustmentDecreaseIntent():
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

  void _handleChange(double newValue, {bool animated = false}) {
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

    // We have to check this in case the change was triggered from the widget update.
    if (widget.value != newValue) {
      widget.onChange?.call(newValue);
    }

    if (!state.editing.value) {
      widget.onEditingComplete?.call(newValue);
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
