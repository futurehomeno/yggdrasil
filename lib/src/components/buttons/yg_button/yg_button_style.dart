import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_button/enum/yg_button_state.dart';
import 'package:yggdrasil/src/theme/button/button_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgButtonStyle extends YgBaseButtonStyle<YgButtonState> {
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

  // @override
  // BoxConstraints resolveConstraints(BuildContext context, Set<YgButtonState> states) {
  //   return const BoxConstraints(
  //     minWidth: 80,
  //     minHeight: 26,
  //   );
  // }

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
        return ButtonVariantTheme.primary(_theme);
      case YgButtonVariant.secondary:
        return ButtonVariantTheme.secondary(_theme);
      case YgButtonVariant.text:
        return ButtonVariantTheme.text(_theme);
      case YgButtonVariant.critical:
        return ButtonVariantTheme.critical(_theme);
      case YgButtonVariant.link:
        return ButtonVariantTheme.link(_theme);
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

  factory ButtonVariantTheme.primary(YgButtonTheme theme) => ButtonVariantTheme(
        backgroundColor: theme.primaryButtonTheme.backgroundColor,
        textStyle: theme.primaryButtonTheme.textStyle,
        disabledTextStyle: theme.primaryButtonTheme.disabledTextStyle,
        borderGradient: theme.primaryButtonTheme.borderGradient,
        disabledBorderGradient: theme.primaryButtonTheme.disabledBorderGradient,
        iconDefaultColor: theme.primaryButtonTheme.iconDefaultColor,
        iconDisabledColor: theme.primaryButtonTheme.iconDisabledColor,
      );

  factory ButtonVariantTheme.secondary(YgButtonTheme theme) => ButtonVariantTheme(
        backgroundColor: theme.secondaryButtonTheme.backgroundColor,
        textStyle: theme.secondaryButtonTheme.textStyle,
        disabledTextStyle: theme.secondaryButtonTheme.disabledTextStyle,
        borderGradient: theme.secondaryButtonTheme.borderGradient,
        disabledBorderGradient: theme.secondaryButtonTheme.disabledBorderGradient,
        iconDefaultColor: theme.secondaryButtonTheme.iconDefaultColor,
        iconDisabledColor: theme.secondaryButtonTheme.iconDisabledColor,
      );

  factory ButtonVariantTheme.text(YgButtonTheme theme) => ButtonVariantTheme(
        backgroundColor: theme.textButtonTheme.backgroundColor,
        textStyle: theme.textButtonTheme.textStyle,
        disabledTextStyle: theme.textButtonTheme.disabledTextStyle,
        borderGradient: theme.textButtonTheme.borderGradient,
        disabledBorderGradient: theme.textButtonTheme.disabledBorderGradient,
        iconDefaultColor: theme.textButtonTheme.iconDefaultColor,
        iconDisabledColor: theme.textButtonTheme.iconDisabledColor,
      );

  factory ButtonVariantTheme.critical(YgButtonTheme theme) => ButtonVariantTheme(
        backgroundColor: theme.criticalButtonTheme.backgroundColor,
        textStyle: theme.criticalButtonTheme.textStyle,
        disabledTextStyle: theme.criticalButtonTheme.disabledTextStyle,
        borderGradient: theme.criticalButtonTheme.borderGradient,
        disabledBorderGradient: theme.criticalButtonTheme.disabledBorderGradient,
        iconDefaultColor: theme.criticalButtonTheme.iconDefaultColor,
        iconDisabledColor: theme.criticalButtonTheme.iconDisabledColor,
      );

  factory ButtonVariantTheme.link(YgButtonTheme theme) => ButtonVariantTheme(
        backgroundColor: theme.linkButtonTheme.backgroundColor,
        textStyle: theme.linkButtonTheme.textStyle,
        disabledTextStyle: theme.linkButtonTheme.disabledTextStyle,
        borderGradient: theme.linkButtonTheme.borderGradient,
        disabledBorderGradient: theme.linkButtonTheme.disabledBorderGradient,
        iconDefaultColor: theme.linkButtonTheme.iconDefaultColor,
        iconDisabledColor: theme.linkButtonTheme.iconDisabledColor,
      );

  final Color backgroundColor;
  final TextStyle textStyle;
  final TextStyle disabledTextStyle;
  final LinearGradient borderGradient;
  final LinearGradient disabledBorderGradient;
  final Color iconDefaultColor;
  final Color iconDisabledColor;
}
