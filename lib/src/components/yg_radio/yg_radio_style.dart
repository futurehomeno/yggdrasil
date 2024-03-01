import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/radio/radio_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_radio_state.dart';

class YgRadioStyle extends YgStyleWithDefaults<YgRadioState> {
  YgRadioStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Color> centerDotColor = animate(_resolveCenterDotColor);
  late final YgAnimatedProperty<Color> backgroundColor = animate(_resolveBackgroundColor);
  late final YgAnimatedProperty<double> borderSize = animate(_resolveBorderSize);
  late final YgAnimatedProperty<Color> borderColor = animate(_resolveBorderColor);
  late final YgAnimatedProperty<double> centerDotSize = animate(_resolveCenterDotSize);
  late final YgDrivenProperty<MouseCursor> mouseCursor = drive(_resolveMouseCursor);
  late final YgDrivenProperty<double> radioSize = all(_resolveRadioSize);

  double _resolveRadioSize() {
    return _theme.size;
  }

  Color _resolveCenterDotColor() {
    if (state.disabled.value) {
      return _theme.centerDotDisabledColor;
    }

    return _theme.centerDotDefaultColor;
  }

  Color _resolveBackgroundColor() {
    if (state.disabled.value) {
      return _theme.backgroundDisabledColor;
    }

    return _theme.backgroundDefaultColor;
  }

  double _resolveBorderSize() {
    if (state.disabled.value || !state.selected.value) {
      return _theme.borderDefaultOrDisabledSize;
    }

    return _theme.borderSelectedSize;
  }

  Color _resolveBorderColor() {
    if (state.disabled.value) {
      return _theme.borderDisabledColor;
    }

    final bool interacted = state.focused.value || state.hovered.value;

    if (state.error.value) {
      if (interacted) {
        return _theme.borderErrorFocusHoverColor;
      }

      return _theme.borderErrorColor;
    }

    if (state.selected.value) {
      if (interacted) {
        return _theme.borderSelectedFocusHoverColor;
      }

      return _theme.borderSelectedColor;
    }

    if (interacted) {
      return _theme.borderFocusHoverColor;
    }

    return _theme.borderDefaultColor;
  }

  double _resolveCenterDotSize() {
    if (state.selected.value) {
      return _theme.centerDotSelectedSize;
    }

    return _theme.centerDotDefaultSize;
  }

  MouseCursor _resolveMouseCursor() {
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
