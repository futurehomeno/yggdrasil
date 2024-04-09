import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_checkbox/checkbox/yg_checkbox_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgCheckboxStyle extends YgStyle<YgCheckboxState> {
  YgCheckboxStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedProperty<Color> borderColor = animate(_resolveBorderColor);
  late final YgAnimatedProperty<Color> backgroundColor = animate(_resolveBackgroundColor);
  late final YgAnimatedProperty<Color> iconColor = animate(_resolveIconColor);
  late final YgAnimatedProperty<double> iconScale = animate(_resolveIconScale);
  late final YgAnimatedProperty<double> borderToCenterFraction = animate(_resolveBorderToCenterFraction);
  late final YgAnimatedProperty<double> checkToMinusFraction = animate(_resolveCheckToMinusFraction);
  late final YgDrivenProperty<MouseCursor> mouseCursor = drive(_resolveMouseCursor);
  late final YgDrivenProperty<double> size = all(_resolveSize);
  late final YgDrivenProperty<double> borderWidth = all(_resolveBorderWidth);
  late final YgDrivenProperty<BorderRadius> borderRadius = all(_resolveBorderRadius);

  // region Border

  BorderRadius _resolveBorderRadius() {
    return _theme.borderRadius;
  }

  double _resolveBorderWidth() {
    return _theme.borderWidth;
  }

  Color _resolveBorderColor() {
    if (state.disabled.value) {
      return _theme.disabledBorderColor;
    }

    final bool interacted = state.focused.value || state.hovered.value;

    if (state.error.value) {
      if (interacted) {
        return _theme.errorFocusHoverBorderColor;
      }

      return _theme.errorBorderColor;
    }

    if (state.checked.value != false) {
      if (interacted) {
        return _theme.checkedFocusHoverBorderColor;
      }

      return _theme.checkedBorderColor;
    }

    if (interacted) {
      return _theme.focusHoverBorderColor;
    }

    return _theme.defaultBorderColor;
  }

  double _resolveBorderToCenterFraction() {
    if (state.disabled.value || (state.checked.value == false)) {
      return 0;
    }

    return 1;
  }

  // endregion

  // region Icon

  double _resolveIconScale() {
    if (state.checked.value == false) {
      return 0;
    }

    return 1;
  }

  Color _resolveIconColor() {
    if (state.disabled.value) {
      return _theme.disabledIconColor;
    }

    return _theme.defaultIconColor;
  }

  double _resolveCheckToMinusFraction() {
    if (state.checked.value != null) {
      return 1;
    }

    return 0;
  }

  // endregion

  MouseCursor _resolveMouseCursor() {
    if (state.disabled.value) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  Color _resolveBackgroundColor() {
    if (state.disabled.value) {
      return _theme.disabledBackgroundColor;
    }

    return _theme.defaultBackgroundColor;
  }

  double _resolveSize() {
    return _theme.size;
  }

  YgCheckboxTheme get _theme => context.checkboxTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}
