import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_radio/enums/yg_radio_state.dart';
import 'package:yggdrasil/src/theme/radio/radio_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgRadioStyle extends YgAnimatedStyle<YgRadioState> {
  YgRadioStyle({
    required super.controller,
    required super.vsync,
  });

  late final YgAnimatedColorProperty<YgRadioState> backgroundColor =
      YgAnimatedColorProperty<YgRadioState>.fromStyle(this, _resolveBackgroundColor);
  late final YgAnimatedDoubleProperty<YgRadioState> handleSize =
      YgAnimatedDoubleProperty<YgRadioState>.fromStyle(this, _resolveHandleSize);
  late final YgAnimatedColorProperty<YgRadioState> handleColor =
      YgAnimatedColorProperty<YgRadioState>.fromStyle(this, _resolveHandleColor);
  late final YgAnimatedDoubleProperty<YgRadioState> helperHandleSize =
      YgAnimatedDoubleProperty<YgRadioState>.fromStyle(this, _resolveHelperHandleSize);
  late final YgAnimatedProperty<YgRadioState, MouseCursor> mouseCursor =
      YgAnimatedProperty<YgRadioState, MouseCursor>.fromStyle(this, _resolveMouseCursor);

  Color _resolveBackgroundColor(BuildContext context, Set<YgRadioState> states) {
    if (states.contains(YgRadioState.selected)) {
      if (states.contains(YgRadioState.disabled)) {
        return _theme.selectedDisabledBackgroundColor;
      }
      if (states.contains(YgRadioState.hovered) || states.contains(YgRadioState.focused)) {
        return _theme.selectedHoveredBackgroundColor;
      }

      return _theme.selectedBackgroundColor;
    }

    if (states.contains(YgRadioState.disabled)) {
      return _theme.deselectedDisabledBackgroundColor;
    }
    if (states.contains(YgRadioState.hovered) || states.contains(YgRadioState.focused)) {
      return _theme.deselectedHoveredBackgroundColor;
    }

    return _theme.deselectedBackgroundColor;
  }

  double _resolveHandleSize(BuildContext context, Set<YgRadioState> states) {
    if (states.contains(YgRadioState.disabled)) {
      return _theme.deselectedHandleSize;
    }
    if (states.contains(YgRadioState.selected)) {
      return _theme.selectedHandleSize;
    }

    return _theme.deselectedHandleSize;
  }

  Color _resolveHandleColor(BuildContext context, Set<YgRadioState> states) {
    if (states.contains(YgRadioState.disabled)) {
      return _theme.disabledHandleColor;
    }
    if (states.contains(YgRadioState.selected)) {
      return _theme.selectedHandleColor;
    }

    return _theme.deselectedHandleColor;
  }

  double _resolveHelperHandleSize(BuildContext context, Set<YgRadioState> states) {
    if (states.contains(YgRadioState.disabled)) {
      if (states.contains(YgRadioState.selected)) {
        return _theme.disabledSelectedHelperHandleSize;
      }

      return _theme.disabledDeselectedHelperHandleSize;
    }
    // Helper handle should only show for disabled states.
    // Returning `null` does not work as the widget will still render.

    return 0.0;
  }

  MouseCursor _resolveMouseCursor(BuildContext context, Set<YgRadioState> states) {
    if (states.contains(YgRadioState.disabled)) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  @override
  Set<YgDynamicAnimatedProperty<YgRadioState>> get properties => <YgDynamicAnimatedProperty<YgRadioState>>{
        backgroundColor,
        handleSize,
        handleColor,
        helperHandleSize,
        mouseCursor,
      };

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;

  YgRadioTheme get _theme => context.radioTheme;
}
