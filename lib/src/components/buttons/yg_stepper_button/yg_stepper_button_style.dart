import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_stepper_button/enums/_enums.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'yg_stepper_button_state.dart';

class YgStepperButtonStyle extends YgButtonBaseStyle<YgStepperButtonState> {
  YgStepperButtonStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor() {
    return Colors.transparent;
  }

  @override
  BoxConstraints resolveConstraints() {
    final EdgeInsets padding = switch (state.size.value) {
      YgStepperButtonSize.large => _theme.paddingLarge,
      YgStepperButtonSize.medium => _theme.paddingMedium,
    };

    return BoxConstraints.tight(
      padding.inflateSize(
        Size.square(
          _theme.iconSize,
        ),
      ),
    );
  }

  @override
  double resolveIconSize() {
    return _theme.iconSize;
  }

  @override
  Color resolveIconColor() {
    if (state.disabled.value) {
      return _theme.disabledIconColor;
    }

    return _theme.iconColor;
  }

  @override
  Color resolveSplashColor() {
    return _theme.splashColor;
  }

  @override
  OutlinedBorder resolveOutlinedBorder() {
    if (state.disabled.value) {
      return YgRoundedRectangleGradientBorder(
        gradient: _theme.disabledBorderGradient,
        borderRadius: _theme.borderRadius,
        width: _theme.borderWidth,
      );
    }

    return YgRoundedRectangleGradientBorder(
      gradient: _theme.borderGradient,
      borderRadius: _theme.borderRadius,
      width: _theme.borderWidth,
    );
  }

  YgStepperButtonTheme get _theme => context.stepperButtonTheme;
}
