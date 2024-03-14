import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yggdrasil/src/components/yg_slider/_yg_slider.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_state.dart';
import 'package:yggdrasil/src/components/yg_slider/yg_slider_style.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_slider_render_widget.dart';
import 'yg_slider_value_indicator_render_widget.dart';

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
    this.currentValue,
    this.focusNode,
    this.stepper = false,
    this.autofocus = false,
    this.disabled = false,
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

  final FocusNode? focusNode;

  final bool autofocus;

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

  final OverlayPortalController _portalController = OverlayPortalController()..show();

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

  // Keyboard mapping for a focused slider when using directional navigation.
  // The vertical inputs are not handled to allow navigating out of the slider.
  static const Map<ShortcutActivator, Intent> _directionalNavShortcutMap = <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.arrowLeft): _YgSliderAdjustmentDecreaseIntent(),
    SingleActivator(LogicalKeyboardKey.arrowRight): _YgSliderAdjustmentIncreaseIntent(),
  };

  // Keyboard mapping for a focused slider.
  static const Map<ShortcutActivator, Intent> _traditionalNavShortcutMap = <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.arrowUp): _YgSliderAdjustmentIncreaseIntent(),
    SingleActivator(LogicalKeyboardKey.arrowDown): _YgSliderAdjustmentDecreaseIntent(),
    ..._directionalNavShortcutMap,
  };

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowHoverHighlight: state.hovered.update,
      onShowFocusHighlight: state.focused.update,
      shortcuts: switch (MediaQuery.navigationModeOf(context)) {
        NavigationMode.directional => _directionalNavShortcutMap,
        NavigationMode.traditional => _traditionalNavShortcutMap,
      },
      actions: <Type, Action<Intent>>{
        _YgSliderAdjustmentIntent: CallbackAction<_YgSliderAdjustmentIntent>(
          onInvoke: _handleAction,
        ),
      },
      mouseCursor: SystemMouseCursors.click,
      focusNode: _focusNodeManager.value,
      autofocus: widget.autofocus,
      enabled: !widget.disabled,
      child: OverlayPortal(
        controller: _portalController,
        overlayChildBuilder: (BuildContext context) {
          return YgSliderValueIndicatorRenderWidget(
            style: style,
            layerLink: _layerLink,
            value: _valueController,
          );
        },
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
      ),
    );
  }

  void _handleAction(_YgSliderAdjustmentIntent intent) {
    final double step = widget.stepSize ?? ((widget.max - widget.min) / 20);

    switch (intent) {
      case _YgSliderAdjustmentIncreaseIntent():
        _handleChange(_targetValue + step);
      case _YgSliderAdjustmentDecreaseIntent():
        _handleChange(_targetValue - step);
    }
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
        curve: Curves.easeInOut,
        duration: const Duration(seconds: 1),
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
  }

  void _handleEditingChanged(bool editing) {
    if (editing == state.editing.value) {
      return;
    }

    state.editing.value = editing;
    if (editing) {
      state.recentlyEdited.value = true;

      _recentEditTimer?.cancel();
      _updateIncreasingState();

      // Update difference indicator value.
      if (widget.currentValue == null &&
          widget.differenceIndicator &&
          style.differenceIndicatorColor.value == Colors.transparent) {
        _currentValueController.value = _valueController.value;
      }
    } else {
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
  }
}

class _YgSliderAdjustmentIntent extends Intent {
  const _YgSliderAdjustmentIntent();
}

class _YgSliderAdjustmentIncreaseIntent extends _YgSliderAdjustmentIntent {
  const _YgSliderAdjustmentIncreaseIntent();
}

class _YgSliderAdjustmentDecreaseIntent extends _YgSliderAdjustmentIntent {
  const _YgSliderAdjustmentDecreaseIntent();
}
