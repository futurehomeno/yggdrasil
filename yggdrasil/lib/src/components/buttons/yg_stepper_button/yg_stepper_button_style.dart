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
    switch (state.variant.value) {
      case YgStepperButtonVariant.outlined:
        return Colors.transparent;

      case YgStepperButtonVariant.filled:
        if (state.disabled.value) {
          return _theme.filledDisabledColor;
        }

        return state.color.value ?? _theme.filledColor;
    }
  }

  @override
  BoxConstraints resolveConstraints() {
    final EdgeInsets padding = switch (state.size.value) {
      YgStepperButtonSize.large => _theme.paddingLarge,
      YgStepperButtonSize.medium => _theme.paddingMedium,
      YgStepperButtonSize.small => _theme.paddingSmall,
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
    switch (state.variant.value) {
      case YgStepperButtonVariant.outlined:
        if (state.disabled.value) {
          return _theme.disabledIconColor;
        }

        return state.color.value ?? _theme.iconColor;

      case YgStepperButtonVariant.filled:
        if (state.disabled.value) {
          return _theme.filledDisabledIconColor;
        }

        return _theme.filledIconColor;
    }
  }

  @override
  Color resolveSplashColor() {
    switch (state.variant.value) {
      case YgStepperButtonVariant.outlined:
        return _theme.splashColor;

      case YgStepperButtonVariant.filled:
        return super.resolveSplashColor();
    }
  }

  @override
  OutlinedBorder resolveOutlinedBorder() {
    return YgRoundedRectangleGradientBorder(
      gradient: _resolveBorderGradient(),
      borderRadius: _theme.borderRadius,
      width: _theme.borderWidth,
    );
  }

  LinearGradient _resolveBorderGradient() {
    switch (state.variant.value) {
      case YgStepperButtonVariant.outlined:
        if (state.disabled.value) {
          return _theme.disabledBorderGradient;
        }

        final Color? color = state.color.value;
        if (color != null) {
          return LinearGradient(
            colors: <Color>[
              color,
              color,
            ],
          );
        }

        return _theme.borderGradient;

      case YgStepperButtonVariant.filled:
        // Matches the fill so the button appears borderless.
        final Color color = resolveColor();

        return LinearGradient(
          colors: <Color>[
            color,
            color,
          ],
        );
    }
  }

  YgStepperButtonTheme get _theme => context.stepperButtonTheme;
}
