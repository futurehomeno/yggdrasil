import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/fields/enums/yg_field_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgFieldContentStyle extends YgAnimatedStyle<YgFieldState> {
  YgFieldContentStyle({
    required super.controller,
    required super.vsync,
  });

  late final YgAnimatedTextStyleProperty<YgFieldState> valueTextStyle =
      YgAnimatedTextStyleProperty<YgFieldState>.fromStyle(this, _resolveValueTextStyle);
  late final YgAnimatedTextStyleProperty<YgFieldState> placeholderTextStyle =
      YgAnimatedTextStyleProperty<YgFieldState>.fromStyle(this, _resolvePlaceholderTextStyle);
  late final YgAnimatedTextStyleProperty<YgFieldState> labelTextStyle =
      YgAnimatedTextStyleProperty<YgFieldState>.fromStyle(this, _resolveLabelTextStyle);
  late final YgAnimatedOffsetProperty<YgFieldState> labelOffset =
      YgAnimatedOffsetProperty<YgFieldState>.fromStyle(this, _resolveLabelOffset);

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

  bool _getFloatLabel(Set<YgFieldState> states) =>
      states.contains(YgFieldState.filled) ||
      states.contains(YgFieldState.focused) ||
      states.contains(YgFieldState.placeholder);

  YgFieldTheme get _fieldTheme => context.fieldTheme;

  YgFieldContentTheme get _theme => _fieldTheme.contentTheme;

  double get labelFloatingHeight => _theme.labelFocusFilledTextStyle.computedHeight;

  @override
  Curve get curve => _fieldTheme.animationCurve;

  @override
  Duration get duration => _fieldTheme.animationDuration;

  @override
  Set<YgDynamicAnimatedProperty<YgFieldState>> get properties => <YgDynamicAnimatedProperty<YgFieldState>>{
        valueTextStyle,
        placeholderTextStyle,
        labelTextStyle,
        labelOffset,
      };
}
