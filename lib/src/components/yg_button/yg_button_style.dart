import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'enums/_enums.dart';
import 'properties/_properties.dart';

/// Button style for YgButtons.
///
/// Variation of the [ButtonStyle] to better fit Yg buttons.
/// Use [toButtonStyle] to convert to material [ButtonStyle].
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
        return _buildPrimaryButton(
          context: context,
          size: size,
        );
      case ButtonVariant.secondary:
        return _buildSecondaryButton(
          context: context,
          size: size,
        );
      case ButtonVariant.text:
        return _buildTextButton(
          context: context,
          size: size,
        );
      case ButtonVariant.link:
        return _buildLinkButton(
          context: context,
          size: size,
        );
      case ButtonVariant.critical:
        return _buildCriticalButton(
          context: context,
          size: size,
        );
    }
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

  static YgButtonStyle _buildPrimaryButton({
    required BuildContext context,
    required ButtonSize size,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonTheme.primaryButtonTheme.backgroundColor,
      textStyle: context.buttonTheme.primaryButtonTheme.textStyle,
      disabledTextStyle: context.buttonTheme.primaryButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonTheme.primaryButtonTheme.borderGradient,
        borderRadius: context.buttonTheme.borderRadius,
        width: context.buttonTheme.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonTheme.primaryButtonTheme.disabledBorderGradient,
        borderRadius: context.buttonTheme.borderRadius,
        width: context.buttonTheme.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  static YgButtonStyle _buildSecondaryButton({
    required BuildContext context,
    required ButtonSize size,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonTheme.secondaryButtonTheme.backgroundColor,
      textStyle: context.buttonTheme.secondaryButtonTheme.textStyle,
      disabledTextStyle: context.buttonTheme.secondaryButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonTheme.secondaryButtonTheme.borderGradient,
        borderRadius: context.buttonTheme.borderRadius,
        width: context.buttonTheme.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonTheme.secondaryButtonTheme.disabledBorderGradient,
        borderRadius: context.buttonTheme.borderRadius,
        width: context.buttonTheme.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  static YgButtonStyle _buildTextButton({
    required BuildContext context,
    required ButtonSize size,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonTheme.textButtonTheme.backgroundColor,
      textStyle: context.buttonTheme.textButtonTheme.textStyle,
      disabledTextStyle: context.buttonTheme.textButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonTheme.textButtonTheme.borderGradient,
        borderRadius: context.buttonTheme.borderRadius,
        width: context.buttonTheme.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonTheme.textButtonTheme.disabledBorderGradient,
        borderRadius: context.buttonTheme.borderRadius,
        width: context.buttonTheme.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  static YgButtonStyle _buildLinkButton({
    required BuildContext context,
    required ButtonSize size,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonTheme.linkButtonTheme.backgroundColor,
      textStyle: context.buttonTheme.linkButtonTheme.textStyle,
      disabledTextStyle: context.buttonTheme.linkButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonTheme.linkButtonTheme.borderGradient,
        borderRadius: context.buttonTheme.borderRadius,
        width: context.buttonTheme.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonTheme.linkButtonTheme.disabledBorderGradient,
        borderRadius: context.buttonTheme.borderRadius,
        width: context.buttonTheme.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }

  static YgButtonStyle _buildCriticalButton({
    required BuildContext context,
    required ButtonSize size,
  }) {
    return YgButtonStyle(
      backgroundColor: context.buttonTheme.criticalButtonTheme.backgroundColor,
      textStyle: context.buttonTheme.criticalButtonTheme.textStyle,
      disabledTextStyle: context.buttonTheme.criticalButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonTheme.criticalButtonTheme.borderGradient,
        borderRadius: context.buttonTheme.borderRadius,
        width: context.buttonTheme.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: context.buttonTheme.criticalButtonTheme.disabledBorderGradient,
        borderRadius: context.buttonTheme.borderRadius,
        width: context.buttonTheme.borderWidth,
      ),
      padding: size.buildPadding(context),
    );
  }
}
