import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_radio/enums/yg_radio_state.dart';
import 'package:yggdrasil/src/theme/radio/radio_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgRadioStyle extends YgStyle<YgRadioState> {
  YgRadioStyle({
    required super.controller,
    required super.vsync,
  });

  late final YgAnimatedColorProperty backgroundColor;
  late final YgAnimatedDoubleProperty handleSize;
  late final YgAnimatedColorProperty handleColor;
  late final YgAnimatedDoubleProperty helperHandleSize;
  late final YgDrivenProperty<MouseCursor> mouseCursor;

  @override
  void init() {
    backgroundColor = animate(
      YgColorProperty<YgRadioState>.resolveWith(_resolveBackgroundColor),
      duration: duration,
      curve: curve,
    );
    handleSize = animate(
      YgDoubleProperty<YgRadioState>.resolveWith(_resolveHandleSize),
      duration: duration,
      curve: curve,
    );
    handleColor = animate(
      YgColorProperty<YgRadioState>.resolveWith(_resolveHandleColor),
      duration: duration,
      curve: curve,
    );
    helperHandleSize = animate(
      YgDoubleProperty<YgRadioState>.resolveWith(_resolveHelperHandleSize),
      duration: duration,
      curve: curve,
    );
    mouseCursor = drive(
      YgProperty<YgRadioState, MouseCursor>.resolveWith(_resolveMouseCursor),
    );
  }

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

  Curve get curve => _theme.animationCurve;

  Duration get duration => _theme.animationDuration;

  YgRadioTheme get _theme => context.radioTheme;
}
