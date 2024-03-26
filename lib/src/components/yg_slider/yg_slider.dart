import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_slider/value_indicator/yg_slider_value_indicator.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_style.dart';
import 'package:yggdrasil/src/theme/slider/slider_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_continuous_animation_controller.dart';
import 'yg_slider_custom_key_repeat_listener.dart';
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
  /// Manages the [FocusNode] of the slider.
  late final YgControllerManager<FocusNode> _focusNodeManager = manageController(
    createController: () => FocusNode(),
    getUserController: () => widget.focusNode,
    listener: _focusChanged,
  );

  /// Animates the value of the slider.
  late final YgContinuousAnimationController _valueController = YgContinuousAnimationController(
    vsync: this,
    value: _targetValue,
    curve: Curves.easeOut,
    duration: const Duration(milliseconds: 80),
  );

  /// Animates the current value of the slider, displayed in the difference indicator.
  late final AnimationController _currentValueController = AnimationController.unbounded(
    vsync: this,
    value: widget.currentValue ?? 0,
    duration: const Duration(milliseconds: 200),
  );

  /// Timer which resets the recentlyEdited state to false when expired.
  Timer? _recentEditTimer;

  /// The actual value of the slider rather than the displayed value.
  late double _targetValue;

  /// Whether the [_targetValue] can increase.
  late bool _canIncrease;

  /// Whether the [_targetValue] can decrease.
  late bool _canDecrease;

  /// [LayerLink] used to link the value indicator and the slider renderer together.
  final LayerLink _layerLink = LayerLink();

  /// The key of the slider renderer repaint boundary.
  ///
  /// Prevents the slider renderer and repaint boundary from being recreated on
  /// a rebuild which shifts the layout of the slider.
  final Key _contentKey = GlobalKey();

  /// The key of the focusable widget.
  ///
  /// Used to prevent a rebuild causing a loss of focus.
  final Key _focusKey = GlobalKey();

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

  void _focusChanged() {
    state.focused.value = _focusNodeManager.value.hasFocus;
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
          duration: const Duration(milliseconds: 200),
        );
      }
    }

    // Don't allow the value to be changed if the user is editing it.
    if (widget.value != _targetValue && !state.editing.value) {
      // Can ignore this because isRebuilding is used to check if the setState is needed.
      // ignore: avoid-unnecessary-setstate
      _handleWidgetUpdate(widget.value);
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

    final double effectiveStepSize = _effectiveStepSize;
    final double steps = (widget.max - widget.min) / effectiveStepSize;

    const Duration repeatDelay = Duration(milliseconds: 600);

    const double minIntervalMs = 1000 / 30; // Assume 60 fps.
    const int totalValueStepTransitionDuration = 3000;
    final double baseStepIntervalMs = totalValueStepTransitionDuration / steps;
    const double maxSteps = totalValueStepTransitionDuration / minIntervalMs;

    final int repeatedStepSizeMultiplier = (steps / maxSteps).ceil();

    final double repeatedStepSize = effectiveStepSize * repeatedStepSizeMultiplier;
    final Duration interval = Duration(milliseconds: (baseStepIntervalMs / repeatedStepSizeMultiplier).round());

    Widget content = RepaintBoundary(
      key: _contentKey,
      child: YgSliderRenderWidget(
        style: style,
        currentValue: _currentValueController,
        value: _valueController,
        onChange: _handleDragUpdate,
        editingChanged: _handleEditingChanged,
        state: state,
        layerLink: _layerLink,
        max: widget.max,
        min: widget.min,
      ),
    );

    if (!widget.disabled) {
      content = MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => state.hovered.value = true,
        onExit: (_) => state.hovered.value = false,
        child: Actions(
          actions: <Type, Action<Intent>>{
            // Prevent the arrow keys from triggering navigation actions.
            DirectionalFocusIntent: DoNothingAction(),
          },
          child: YgSliderCustomKeyRepeatListener(
            key: _focusKey,
            onEditingChanged: _handleEditingChanged,
            focusNode: _focusNodeManager.value,
            listeners: <LogicalKeyboardKey, RepeatableCallback>{
              LogicalKeyboardKey.arrowLeft: ({required bool repeat}) => _handleStepUpdate(
                    _targetValue - (repeat ? repeatedStepSize : effectiveStepSize),
                  ),
              LogicalKeyboardKey.arrowRight: ({required bool repeat}) => _handleStepUpdate(
                    _targetValue + (repeat ? repeatedStepSize : effectiveStepSize),
                  ),
            },
            autoFocus: widget.autofocus,
            interval: interval,
            repeatDelay: repeatDelay,
            child: content,
          ),
        ),
      );
    }

    if (widget.stepper) {
      content = Row(
        children: <Widget>[
          YgSliderRepeatingStepperButton(
            icon: YgIcons.minus,
            onTrigger: ({required bool repeat}) => _handleStepUpdate(
              _targetValue - (repeat ? repeatedStepSize : effectiveStepSize),
            ),
            editingChanged: _handleEditingChanged,
            disabled: !_canDecrease,
            interval: interval,
            repeatDelay: repeatDelay,
          ),
          Expanded(child: content),
          YgSliderRepeatingStepperButton(
            icon: YgIcons.plus,
            disabled: !_canIncrease,
            onTrigger: ({required bool repeat}) => _handleStepUpdate(
              _targetValue + (repeat ? repeatedStepSize : effectiveStepSize),
            ),
            editingChanged: _handleEditingChanged,
            interval: interval,
            repeatDelay: repeatDelay,
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

  /// Update the slider based on a step event.
  void _handleStepUpdate(double newValue) {
    final double clampedValue = newValue.clamp(
      widget.min,
      widget.max,
    );

    if (!state.editing.value) {
      state.recentlyEdited.value = true;
      _recentEditTimer?.cancel();
      _recentEditTimer = Timer(
        const Duration(seconds: 2),
        _handleRecentEditTimeout,
      );
    }

    _valueController.update(
      currentValue: clampedValue,
      targetValue: clampedValue,
      maxDifference: _effectiveStepSize / 2,
    );

    _updateTargetValue(clampedValue);
  }

  /// Update the slider based on a drag event.
  void _handleDragUpdate(double newValue) {
    final double clampedValue = newValue.clamp(
      widget.min,
      widget.max,
    );

    final double? stepSize = widget.stepSize;

    if (stepSize == null) {
      _valueController.jumpTo(clampedValue);
      _updateTargetValue(clampedValue);
    } else {
      final double targetValue = ((clampedValue / stepSize).round() * stepSize);

      _valueController.update(
        currentValue: clampedValue,
        targetValue: targetValue,
        maxDifference: stepSize / 2,
      );

      _updateTargetValue(targetValue);
    }
  }

  /// Update the slider based on the widget value being updated.
  void _handleWidgetUpdate(double newValue) {
    _valueController.animateTo(newValue);
    _updateTargetValue(newValue, isRebuilding: true);
  }

  void _updateTargetValue(double newValue, {bool isRebuilding = false}) {
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
        print('change while not editing');
        widget.onEditingComplete?.call(newValue);
      }
    }
  }

  void _handleEditingChanged(bool editing) {
    print('editing: $editing');

    if (editing == state.editing.value) {
      return;
    }

    state.editing.value = editing;
    if (editing) {
      _recentEditTimer?.cancel();

      /// Ensure the difference indicator is not visible before changing its value.
      if (widget.currentValue == null &&
          widget.differenceIndicator &&
          style.differenceIndicatorColor.value.opacity == 0.0) {
        _currentValueController.value = _valueController.value;
      }
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
