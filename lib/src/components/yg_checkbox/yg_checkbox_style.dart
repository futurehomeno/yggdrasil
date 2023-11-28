import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_checkbox/yg_checkbox_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

class YgCheckboxStyle extends YgStyleWithDefaults<YgCheckboxState> {
  YgCheckboxStyle({
    required super.state,
    required super.vsync,
  });

  late YgAnimatedColorProperty borderColor;
  late YgAnimatedColorProperty backgroundColor;
  late YgAnimatedColorProperty iconColor;
  late YgAnimatedDoubleProperty borderToCenterFraction;
  late YgAnimatedDoubleProperty checkToMinusFraction;
  late YgDrivenDoubleProperty size;
  late YgDrivenDoubleProperty borderWidth;
  late YgDrivenBorderRadiusProperty borderRadius;

  @override
  void init() {
    borderColor = animate(YgColorProperty<YgCheckboxState>.resolveWith(_resolveBorderColor));
    backgroundColor = animate(YgColorProperty<YgCheckboxState>.resolveWith(_resolveBackgroundColor));
    iconColor = animate(YgColorProperty<YgCheckboxState>.resolveWith(_resolveIconColor));
    borderToCenterFraction = animate(YgDoubleProperty<YgCheckboxState>.resolveWith(_resolveBorderToCenterFraction));
    checkToMinusFraction = animate(YgDoubleProperty<YgCheckboxState>.resolveWith(_resolveCheckToMinusFraction));
    size = drive(YgDoubleProperty<YgCheckboxState>.all(_resolveSize));
    borderWidth = drive(YgDoubleProperty<YgCheckboxState>.all(_resolveBorderWidth));
    borderRadius = drive(YgBorderRadiusProperty<YgCheckboxState>.all(_resolveBorderRadius));
  }

  BorderRadius _resolveBorderRadius(BuildContext context) {
    return _theme.borderRadius;
  }

  double _resolveSize(BuildContext context) {
    return _theme.size;
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

  Color _resolveBackgroundColor(BuildContext context, YgCheckboxState state) {
    if (state.disabled.value) {
      return _theme.disabledBackgroundColor;
    }

    return _theme.defaultBackgroundColor;
  }

  Color _resolveIconColor(BuildContext context, YgCheckboxState state) {
    if (state.checked.value == false) {
      return Colors.transparent;
    }

    if (state.disabled.value) {
      return _theme.disabledIconColor;
    }

    return _theme.defaultIconColor;
  }

  double _resolveBorderToCenterFraction(BuildContext context, YgCheckboxState state) {
    if (state.disabled.value || (state.checked.value == false)) {
      return 0;
    }

    return 1;
  }

  double _resolveCheckToMinusFraction(BuildContext context, YgCheckboxState state) {
    if (state.checked.value == true || !state.triState.value) {
      return 1;
    }

    return 0;
  }

  YgCheckboxTheme get _theme => context.checkboxTheme;

  @override
  Curve get curve => _theme.animationCurve;

  @override
  Duration get duration => _theme.animationDuration;
}
