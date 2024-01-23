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

  late final YgAnimatedColorProperty backgroundColor;
  late final YgAnimatedColorProperty centerDotColor;
  late final YgAnimatedDoubleProperty borderSize;
  late final YgAnimatedColorProperty borderColor;
  late final YgAnimatedDoubleProperty centerDotSize;
  late final YgDrivenProperty<MouseCursor> mouseCursor;
  late final YgDrivenDoubleProperty radioSize;

  @override
  void init() {
    centerDotColor = animate(YgColorProperty<YgRadioState>.resolveWith(_resolveCenterDotColor));
    backgroundColor = animate(YgColorProperty<YgRadioState>.resolveWith(_resolveBackgroundColor));
    borderSize = animate(YgDoubleProperty<YgRadioState>.resolveWith(_resolveBorderSize));
    borderColor = animate(YgColorProperty<YgRadioState>.resolveWith(_resolveBorderColor));
    centerDotSize = animate(YgDoubleProperty<YgRadioState>.resolveWith(_resolveCenterDotSize));
    mouseCursor = drive(YgProperty<YgRadioState, MouseCursor>.resolveWith(_resolveMouseCursor));
    radioSize = drive(YgDoubleProperty<YgRadioState>.all(_resolveRadioSize));
  }

  double _resolveRadioSize(BuildContext context) {
    return _theme.size;
  }

  Color _resolveCenterDotColor(BuildContext context, YgRadioState state) {
    if (state.disabled.value) {
      return _theme.centerDotDisabledColor;
    }

    return _theme.centerDotDefaultColor;
  }

  Color _resolveBackgroundColor(BuildContext context, YgRadioState state) {
    if (state.disabled.value) {
      return _theme.backgroundDisabledColor;
    }

    return _theme.backgroundDefaultColor;
  }

  double _resolveBorderSize(BuildContext context, YgRadioState state) {
    if (state.disabled.value || !state.selected.value) {
      return _theme.borderDefaultOrDisabledSize;
    }

    return _theme.borderSelectedSize;
  }

  Color _resolveBorderColor(BuildContext context, YgRadioState state) {
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

  double _resolveCenterDotSize(BuildContext context, YgRadioState state) {
    if (state.selected.value) {
      return _theme.centerDotSelectedSize;
    }

    return _theme.centerDotDefaultSize;
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
