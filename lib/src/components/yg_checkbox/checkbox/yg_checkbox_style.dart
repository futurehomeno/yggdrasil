import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_checkbox/checkbox/yg_checkbox_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgCheckboxStyle extends YgStyleWithDefaults<YgCheckboxState> {
  YgCheckboxStyle({
    required super.state,
    required super.vsync,
  });

  late final YgAnimatedDoubleProperty checkToMinusFraction;
  late final YgAnimatedColorProperty iconColor;
  late final YgAnimatedDoubleProperty iconScale;
  late final YgAnimatedColorProperty borderColor;
  late final YgAnimatedDoubleProperty borderToCenterFraction;
  late final YgAnimatedColorProperty backgroundColor;
  late final YgDrivenDoubleProperty borderWidth;
  late final YgDrivenBorderRadiusProperty borderRadius;
  late final YgDrivenDoubleProperty size;
  late final YgDrivenProperty<MouseCursor> mouseCursor;

  @override
  void init() {
    borderColor = animate(YgColorProperty<YgCheckboxState>.resolveWith(_resolveBorderColor));
    backgroundColor = animate(YgColorProperty<YgCheckboxState>.resolveWith(_resolveBackgroundColor));
    iconColor = animate(YgColorProperty<YgCheckboxState>.resolveWith(_resolveIconColor));
    iconScale = animate(YgDoubleProperty<YgCheckboxState>.resolveWith(_resolveIconScale));
    borderToCenterFraction = animate(YgDoubleProperty<YgCheckboxState>.resolveWith(_resolveBorderToCenterFraction));
    checkToMinusFraction = animate(YgDoubleProperty<YgCheckboxState>.resolveWith(_resolveCheckToMinusFraction));
    size = drive(YgDoubleProperty<YgCheckboxState>.all(_resolveSize));
    borderWidth = drive(YgDoubleProperty<YgCheckboxState>.all(_resolveBorderWidth));
    borderRadius = drive(YgBorderRadiusProperty<YgCheckboxState>.all(_resolveBorderRadius));
    mouseCursor = drive(YgProperty<YgCheckboxState, MouseCursor>.resolveWith(_resolveMouseCursor));
  }

  // region Border

  MouseCursor _resolveMouseCursor(BuildContext context, YgCheckboxState state) {
    if (state.disabled.value) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  BorderRadius _resolveBorderRadius(BuildContext context) {
    return _theme.borderRadius;
  }

  double _resolveBorderWidth(BuildContext context) {
    return _theme.borderWidth;
  }

  Color _resolveBorderColor(BuildContext context, YgCheckboxState state) {
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

  double _resolveBorderToCenterFraction(BuildContext context, YgCheckboxState state) {
    if (state.disabled.value || (state.checked.value == false)) {
      return 0;
    }

    return 1;
  }

  // endregion

  // region Icon

  double _resolveIconScale(BuildContext context, YgCheckboxState state) {
    if (state.checked.value == false) {
      return 0;
    }

    return 1;
  }

  Color _resolveIconColor(BuildContext context, YgCheckboxState state) {
    if (state.disabled.value) {
      return _theme.disabledIconColor;
    }

    return _theme.defaultIconColor;
  }

  double _resolveCheckToMinusFraction(BuildContext context, YgCheckboxState state) {
    if (state.checked.value != null) {
      return 1;
    }

    return 0;
  }

  // endregion

  Color _resolveBackgroundColor(BuildContext context, YgCheckboxState state) {
    if (state.disabled.value) {
      return _theme.disabledBackgroundColor;
    }

    return _theme.defaultBackgroundColor;
  }

  double _resolveSize(BuildContext context) {
    return _theme.size;
  }

  YgCheckboxTheme get _theme => context.checkboxTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}
