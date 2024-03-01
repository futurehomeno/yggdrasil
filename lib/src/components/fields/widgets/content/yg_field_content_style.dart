import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import '../../yg_field_state.dart';

class YgFieldContentStyle extends YgStyleWithDefaults<YgFieldState> {
  YgFieldContentStyle({
    required super.state,
    required super.vsync,
    required this.floatLabelOnFocus,
  });

  final bool floatLabelOnFocus;

  late final YgAnimatedProperty<TextStyle> valueTextStyle = animate(_resolveValueTextStyle);
  late final YgAnimatedProperty<TextStyle> placeholderTextStyle = animate(_resolvePlaceholderTextStyle);
  late final YgAnimatedProperty<TextStyle> labelTextStyle = animate(_resolveLabelTextStyle);
  late final YgAnimatedProperty<Offset> labelOffset = animate(_resolveLabelOffset);

  TextStyle _resolveValueTextStyle() {
    final TextStyle baseStyle = _theme.valueTextStyle;

    if (state.disabled.value) {
      return baseStyle.copyWith(
        color: _theme.valueDisabledColor,
      );
    }

    return baseStyle.copyWith(
      color: _theme.valueDefaultColor,
    );
  }

  TextStyle _resolvePlaceholderTextStyle() {
    if (state.disabled.value) {
      return _theme.placeholderTextStyle.copyWith(
        color: _theme.placeholderDisabledColor,
      );
    }

    return _theme.placeholderTextStyle.copyWith(
      color: _theme.placeholderDefaultColor,
    );
  }

  TextStyle _resolveLabelTextStyle() {
    final TextStyle baseStyle = _getFloatLabel(state) ? _theme.labelFocusFilledTextStyle : _theme.labelDefaultTextStyle;

    if (state.disabled.value) {
      return baseStyle.copyWith(
        color: _theme.labelDisabledColor,
      );
    }

    if (state.filled.value || state.showFocusHighlight) {
      return baseStyle.copyWith(
        color: _theme.labelFocusFilledColor,
      );
    }

    return baseStyle.copyWith(
      color: _theme.labelDefaultColor,
    );
  }

  Offset _resolveLabelOffset() {
    if (_getFloatLabel(state)) {
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

  bool _getFloatLabel(YgFieldState state) =>
      state.filled.value || state.placeholder.value || (floatLabelOnFocus && state.showFocusHighlight);

  YgFieldTheme get _fieldTheme => context.fieldTheme;

  YgFieldContentTheme get _theme => _fieldTheme.contentTheme;

  double get labelFloatingHeight => _theme.labelFocusFilledTextStyle.computedHeight;

  @override
  Curve get curve => _fieldTheme.animationCurve;

  @override
  Duration get duration => _fieldTheme.animationDuration;
}
