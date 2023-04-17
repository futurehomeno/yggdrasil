import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'enums/_enums.dart';
import 'properties/_properties.dart';

class YgButtonStyle {
  const YgButtonStyle({
    required this.backgroundColor,
    required this.textStyle,
    required this.disabledTextStyle,
    required this.shape,
    required this.disabledShape,
    required this.padding,
  });

  factory YgButtonStyle.fromVariant({
    required BuildContext context,
    required ButtonVariant variant,
    ButtonSize size = ButtonSize.medium,
  }) {
    switch (variant) {
      case ButtonVariant.primary:
        return YgButtonStyle.primary(
          context: context,
          size: size,
        );
      case ButtonVariant.secondary:
        return YgButtonStyle.secondary(
          context: context,
          size: size,
        );
      case ButtonVariant.text:
        return YgButtonStyle.text(
          context: context,
          size: size,
        );
      case ButtonVariant.link:
        return YgButtonStyle.link(
          context: context,
          size: size,
        );
      case ButtonVariant.critical:
        return YgButtonStyle.critical(
          context: context,
          size: size,
        );
    }
  }

  factory YgButtonStyle.primary({
    required BuildContext context,
    ButtonSize size = ButtonSize.medium,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.primaryButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.primaryButtonTheme.textStyle,
      disabledTextStyle: context.buttonThemes.primaryButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.primaryButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.primaryButtonTheme.disabledBorderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  factory YgButtonStyle.secondary({
    required BuildContext context,
    ButtonSize size = ButtonSize.medium,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.secondaryButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.secondaryButtonTheme.textStyle,
      disabledTextStyle: context.buttonThemes.secondaryButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.secondaryButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.secondaryButtonTheme.disabledBorderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  factory YgButtonStyle.text({
    required BuildContext context,
    ButtonSize size = ButtonSize.medium,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.textButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.textButtonTheme.textStyle,
      disabledTextStyle: context.buttonThemes.textButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.textButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.textButtonTheme.disabledBorderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  factory YgButtonStyle.link({
    required BuildContext context,
    ButtonSize size = ButtonSize.medium,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.linkButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.linkButtonTheme.textStyle,
      disabledTextStyle: context.buttonThemes.linkButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.linkButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.linkButtonTheme.disabledBorderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  factory YgButtonStyle.critical({
    required BuildContext context,
    ButtonSize size = ButtonSize.medium,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonThemes.criticalButtonTheme.backgroundColor,
      textStyle: context.buttonThemes.criticalButtonTheme.textStyle,
      disabledTextStyle: context.buttonThemes.criticalButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.criticalButtonTheme.borderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonThemes.criticalButtonTheme.disabledBorderGradient,
        borderRadius: context.buttonThemes.borderRadius,
        width: context.buttonThemes.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  ButtonStyle toButtonStyle() {
    return ButtonStyle(
      backgroundColor: ButtonStyleButton.allOrNull(backgroundColor),
      textStyle: YgButtonTextStyleProperty(
        textStyle: textStyle,
        disabled: disabledTextStyle,
      ),
      shape: YgButtonOutlinedBorderProperty(
        outlinedBorder: shape,
        disabled: disabledShape,
      ),
      padding: ButtonStyleButton.allOrNull(padding),
      minimumSize: ButtonStyleButton.allOrNull(const Size(80, 26)),
      maximumSize: ButtonStyleButton.allOrNull(Size.infinite),
      visualDensity: VisualDensity.standard,
      animationDuration: const Duration(milliseconds: 200),
      elevation: ButtonStyleButton.allOrNull(0.0),
      alignment: Alignment.center,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: YgButtonMouseCursorProperty(
        mouseCursor: SystemMouseCursors.click,
        disabled: SystemMouseCursors.basic,
      ),
    );
  }

  final Color backgroundColor;
  final TextStyle textStyle;
  final TextStyle disabledTextStyle;
  final OutlinedBorder shape;
  final OutlinedBorder disabledShape;
  final EdgeInsets padding;
}
