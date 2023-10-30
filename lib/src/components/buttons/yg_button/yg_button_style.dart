import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_button/enums/yg_button_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgButtonStyle extends YgButtonBaseStyle<YgButtonState> {
  YgButtonStyle({
    required super.controller,
    required super.vsync,
  });

  @override
  Color resolveColor(BuildContext context, Set<YgButtonState> states) {
    final ButtonVariantTheme variantTheme = getVariantTheme(states);

    return variantTheme.backgroundColor;
  }

  @override
  double resolveIconSize(BuildContext context, Set<YgButtonState> states) {
    return _theme.iconSize;
  }

  @override
  EdgeInsets resolvePadding(BuildContext context, Set<YgButtonState> states) {
    switch (states.size) {
      case YgButtonSize.small:
        return _theme.paddingSmall;
      case YgButtonSize.medium:
        return _theme.paddingMedium;
      case YgButtonSize.large:
        return _theme.paddingLarge;
    }
  }

  @override
  Color resolveIconColor(BuildContext context, Set<YgButtonState> states) {
    final ButtonVariantTheme variantTheme = getVariantTheme(states);

    if (states.disabled) {
      return variantTheme.iconDisabledColor;
    }

    return variantTheme.iconDefaultColor;
  }

  @override
  TextStyle resolveTextStyle(BuildContext context, Set<YgButtonState> states) {
    final ButtonVariantTheme variantTheme = getVariantTheme(states);
    if (states.contains(YgButtonState.disabled)) {
      return variantTheme.disabledTextStyle;
    }

    return variantTheme.textStyle;
  }

  @override
  MouseCursor resolveCursor(BuildContext context, Set<YgButtonState> states) {
    if (states.contains(YgButtonState.disabled)) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  @override
  OutlinedBorder resolveOutlinedBorder(BuildContext context, Set<YgButtonState> states) {
    final ButtonVariantTheme variantTheme = getVariantTheme(states);

    if (states.contains(YgButtonState.disabled)) {
      return YgRoundedRectangleGradientBorder(
        gradient: variantTheme.disabledBorderGradient,
        borderRadius: _theme.borderRadius,
        width: _theme.borderWidth,
      );
    }

    return YgRoundedRectangleGradientBorder(
      gradient: variantTheme.borderGradient,
      borderRadius: _theme.borderRadius,
      width: _theme.borderWidth,
    );
  }

  ButtonVariantTheme getVariantTheme(Set<YgButtonState> states) {
    switch (states.variant) {
      case YgButtonVariant.primary:
        return ButtonVariantTheme.primary(_theme.primaryButtonTheme);
      case YgButtonVariant.secondary:
        return ButtonVariantTheme.secondary(_theme.secondaryButtonTheme);
      case YgButtonVariant.text:
        return ButtonVariantTheme.text(_theme.textButtonTheme);
      case YgButtonVariant.critical:
        return ButtonVariantTheme.critical(_theme.criticalButtonTheme);
      case YgButtonVariant.link:
        return ButtonVariantTheme.link(_theme.linkButtonTheme);
    }
  }

  YgButtonTheme get _theme => context.buttonTheme;

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);
}

// TODO(DEV-1915): Remove this when theme extensions can extend interfaces
class ButtonVariantTheme {
  const ButtonVariantTheme({
    required this.backgroundColor,
    required this.textStyle,
    required this.disabledTextStyle,
    required this.borderGradient,
    required this.disabledBorderGradient,
    required this.iconDefaultColor,
    required this.iconDisabledColor,
  });

  factory ButtonVariantTheme.primary(YgPrimaryButtonTheme theme) => ButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        textStyle: theme.textStyle,
        disabledTextStyle: theme.disabledTextStyle,
        borderGradient: theme.borderGradient,
        disabledBorderGradient: theme.disabledBorderGradient,
        iconDefaultColor: theme.iconDefaultColor,
        iconDisabledColor: theme.iconDisabledColor,
      );

  factory ButtonVariantTheme.secondary(YgSecondaryButtonTheme theme) => ButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        textStyle: theme.textStyle,
        disabledTextStyle: theme.disabledTextStyle,
        borderGradient: theme.borderGradient,
        disabledBorderGradient: theme.disabledBorderGradient,
        iconDefaultColor: theme.iconDefaultColor,
        iconDisabledColor: theme.iconDisabledColor,
      );

  factory ButtonVariantTheme.text(YgTextButtonTheme theme) => ButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        textStyle: theme.textStyle,
        disabledTextStyle: theme.disabledTextStyle,
        borderGradient: theme.borderGradient,
        disabledBorderGradient: theme.disabledBorderGradient,
        iconDefaultColor: theme.iconDefaultColor,
        iconDisabledColor: theme.iconDisabledColor,
      );

  factory ButtonVariantTheme.critical(YgCriticalButtonTheme theme) => ButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        textStyle: theme.textStyle,
        disabledTextStyle: theme.disabledTextStyle,
        borderGradient: theme.borderGradient,
        disabledBorderGradient: theme.disabledBorderGradient,
        iconDefaultColor: theme.iconDefaultColor,
        iconDisabledColor: theme.iconDisabledColor,
      );

  factory ButtonVariantTheme.link(YgLinkButtonTheme theme) => ButtonVariantTheme(
        backgroundColor: theme.backgroundColor,
        textStyle: theme.textStyle,
        disabledTextStyle: theme.disabledTextStyle,
        borderGradient: theme.borderGradient,
        disabledBorderGradient: theme.disabledBorderGradient,
        iconDefaultColor: theme.iconDefaultColor,
        iconDisabledColor: theme.iconDisabledColor,
      );

  final Color backgroundColor;
  final TextStyle textStyle;
  final TextStyle disabledTextStyle;
  final LinearGradient borderGradient;
  final LinearGradient disabledBorderGradient;
  final Color iconDefaultColor;
  final Color iconDisabledColor;
}
