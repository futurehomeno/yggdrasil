import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/radio/radio_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_radio_state.dart';

class YgRadioStyle extends YgStyleWithDefaults<YgRadioState> {
  YgRadioStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedColorProperty backgroundColor;
  late final YgAnimatedDoubleProperty handleSize;
  late final YgAnimatedColorProperty handleColor;
  late final YgAnimatedDoubleProperty helperHandleSize;
  late final YgDrivenProperty<MouseCursor> mouseCursor;
  late final YgDrivenDoubleProperty radioSize;
  late final YgDrivenColorProperty helperHandleColor;

  @override
  void init() {
    backgroundColor = animate(YgColorProperty<YgRadioState>.resolveWith(_resolveBackgroundColor));
    handleSize = animate(YgDoubleProperty<YgRadioState>.resolveWith(_resolveHandleSize));
    handleColor = animate(YgColorProperty<YgRadioState>.resolveWith(_resolveHandleColor));
    helperHandleSize = animate(YgDoubleProperty<YgRadioState>.resolveWith(_resolveHelperHandleSize));
    mouseCursor = drive(YgProperty<YgRadioState, MouseCursor>.resolveWith(_resolveMouseCursor));
    radioSize = drive(YgDoubleProperty<YgRadioState>.all(_resolveRadioSize));
    helperHandleColor = drive(YgColorProperty<YgRadioState>.all(_resolveHelperHandleColor));
  }

  double _resolveRadioSize(BuildContext context) {
    return _theme.size;
  }

  Color _resolveHelperHandleColor(BuildContext context) {
    return _theme.helperHandleColor;
  }

  Color _resolveBackgroundColor(BuildContext context, YgRadioState state) {
    if (state.selected.value) {
      if (state.disabled.value) {
        return _theme.selectedDisabledBackgroundColor;
      }
      if (state.hovered.value || state.focused.value) {
        return _theme.selectedHoveredBackgroundColor;
      }

      return _theme.selectedBackgroundColor;
    }

    if (state.disabled.value) {
      return _theme.deselectedDisabledBackgroundColor;
    }
    if (state.hovered.value || state.focused.value) {
      return _theme.deselectedHoveredBackgroundColor;
    }

    return _theme.deselectedBackgroundColor;
  }

  double _resolveHandleSize(BuildContext context, YgRadioState state) {
    if (state.disabled.value) {
      return _theme.deselectedHandleSize;
    }
    if (state.selected.value) {
      return _theme.selectedHandleSize;
    }

    return _theme.deselectedHandleSize;
  }

  Color _resolveHandleColor(BuildContext context, YgRadioState state) {
    if (state.disabled.value) {
      return _theme.disabledHandleColor;
    }
    if (state.selected.value) {
      return _theme.selectedHandleColor;
    }

    return _theme.deselectedHandleColor;
  }

  double _resolveHelperHandleSize(BuildContext context, YgRadioState state) {
    if (state.disabled.value) {
      if (state.selected.value) {
        return _theme.disabledSelectedHelperHandleSize;
      }

      return _theme.disabledDeselectedHelperHandleSize;
    }
    // Helper handle should only show for disabled state.
    // Returning `null` does not work as the widget will still render.

    return 0.0;
  }

  MouseCursor _resolveMouseCursor(BuildContext context, YgRadioState state) {
    if (state.disabled.value) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;

  YgRadioTheme get _theme => context.radioTheme;
}
