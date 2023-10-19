import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/enums/yg_field_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgFieldContentStyle extends YgStyleWithDefaults<YgFieldState> {
  YgFieldContentStyle({
    required super.controller,
    required super.vsync,
  });

  late final YgAnimatedTextStyleProperty valueTextStyle;
  late final YgAnimatedTextStyleProperty placeholderTextStyle;
  late final YgAnimatedTextStyleProperty labelTextStyle;
  late final YgAnimatedOffsetProperty labelOffset;

  @override
  void init() {
    valueTextStyle = animate(
      YgTextStyleProperty<YgFieldState>.resolveWith(_resolveValueTextStyle),
    );
    placeholderTextStyle = animate(
      YgTextStyleProperty<YgFieldState>.resolveWith(_resolvePlaceholderTextStyle),
    );
    labelTextStyle = animate(
      YgTextStyleProperty<YgFieldState>.resolveWith(_resolveLabelTextStyle),
    );
    labelOffset = animate(
      YgOffsetProperty<YgFieldState>.resolveWith(_resolveLabelOffset),
    );
  }

  TextStyle _resolveValueTextStyle(BuildContext context, Set<YgFieldState> states) {
    final TextStyle baseStyle = _theme.valueTextStyle;

    if (states.disabled) {
      return baseStyle.copyWith(
        color: _theme.valueDisabledColor,
      );
    }

    return baseStyle.copyWith(
      color: _theme.valueDefaultColor,
    );
  }

  TextStyle _resolvePlaceholderTextStyle(BuildContext context, Set<YgFieldState> states) {
    if (states.disabled) {
      return _theme.placeholderTextStyle.copyWith(
        color: _theme.placeholderDisabledColor,
      );
    }

    return _theme.placeholderTextStyle.copyWith(
      color: _theme.placeholderDefaultColor,
    );
  }

  TextStyle _resolveLabelTextStyle(BuildContext context, Set<YgFieldState> states) {
    final TextStyle baseStyle =
        _getFloatLabel(states) ? _theme.labelFocusFilledTextStyle : _theme.labelDefaultTextStyle;

    if (states.disabled) {
      return baseStyle.copyWith(
        color: _theme.labelDisabledColor,
      );
    }

    if (states.focused || states.filled || states.opened) {
      return baseStyle.copyWith(
        color: _theme.labelFocusFilledColor,
      );
    }

    return baseStyle.copyWith(
      color: _theme.labelDefaultColor,
    );
  }

  Offset _resolveLabelOffset(BuildContext context, Set<YgFieldState> states) {
    if (_getFloatLabel(states)) {
      return Offset.zero;
    }

    final double labelDefaultHeight = _theme.labelDefaultTextStyle.computedHeight;
    final double valueDefaultHeight = _theme.valueTextStyle.computedHeight;

    final double combinedHeight = labelFloatingHeight + valueDefaultHeight;

    return Offset(
      0.0,
      ((combinedHeight / labelDefaultHeight) - 1) / 2,
    );
  }

  bool _getFloatLabel(Set<YgFieldState> states) => states.filled || states.focused || states.placeholder;

  YgFieldTheme get _fieldTheme => context.fieldTheme;

  YgFieldContentTheme get _theme => _fieldTheme.contentTheme;

  double get labelFloatingHeight => _theme.labelFocusFilledTextStyle.computedHeight;

  @override
  Curve get curve => _fieldTheme.animationCurve;

  @override
  Duration get duration => _fieldTheme.animationDuration;
}
