import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:yggdrasil/src/components/yg_button/_yg_button.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

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
    required this.iconColor,
    required this.disabledIconColor,
  });

  factory YgButtonStyle.fromVariant({
    required BuildContext context,
    required YgButtonVariant variant,
    YgButtonSize size = YgButtonSize.medium,
  }) {
    switch (variant) {
      case YgButtonVariant.primary:
        return _buildPrimaryButton(
          context: context,
          size: size,
        );
      case YgButtonVariant.secondary:
        return _buildSecondaryButton(
          context: context,
          size: size,
        );
      case YgButtonVariant.text:
        return _buildTextButton(
          context: context,
          size: size,
        );
      case YgButtonVariant.link:
        return _buildLinkButton(
          context: context,
          size: size,
        );
      case YgButtonVariant.critical:
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
      iconColor: YgButtonIconColorProperty(
        color: iconColor,
        disabled: disabledIconColor,
      ),
    );
  }

  final Color backgroundColor;
  final TextStyle textStyle;
  final TextStyle disabledTextStyle;
  final OutlinedBorder shape;
  final OutlinedBorder disabledShape;
  final EdgeInsets padding;
  final Color iconColor;
  final Color disabledIconColor;

  static YgButtonStyle _buildPrimaryButton({
    required BuildContext context,
    required YgButtonSize size,
  }) {
    final YgButtonTheme theme = context.buttonTheme;
    final PrimaryButtonTheme primaryButtonTheme = theme.primaryButtonTheme;

    return YgButtonStyle(
      backgroundColor: primaryButtonTheme.backgroundColor,
      textStyle: primaryButtonTheme.textStyle,
      disabledTextStyle: primaryButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: primaryButtonTheme.borderGradient,
        borderRadius: theme.borderRadius,
        width: theme.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: primaryButtonTheme.disabledBorderGradient,
        borderRadius: theme.borderRadius,
        width: theme.borderWidth,
      ),
      padding: YgButtonMapper.buildPadding(
        theme: theme,
        size: size,
      ),
      iconColor: context.defaults.iconColor,
      disabledIconColor: context.defaults.invertedIconColor,
    );
  }

  static YgButtonStyle _buildSecondaryButton({
    required BuildContext context,
    required YgButtonSize size,
  }) {
    final YgButtonTheme theme = context.buttonTheme;
    final SecondaryButtonTheme secondaryButtonTheme = theme.secondaryButtonTheme;

    return YgButtonStyle(
      backgroundColor: secondaryButtonTheme.backgroundColor,
      textStyle: secondaryButtonTheme.textStyle,
      disabledTextStyle: secondaryButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: secondaryButtonTheme.borderGradient,
        borderRadius: theme.borderRadius,
        width: theme.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: secondaryButtonTheme.disabledBorderGradient,
        borderRadius: theme.borderRadius,
        width: theme.borderWidth,
      ),
      padding: YgButtonMapper.buildPadding(
        theme: theme,
        size: size,
      ),
      iconColor: context.defaults.iconColor,
      disabledIconColor: context.defaults.invertedIconColor,
    );
  }

  static YgButtonStyle _buildTextButton({
    required BuildContext context,
    required YgButtonSize size,
  }) {
    final YgButtonTheme theme = context.buttonTheme;
    final TextButtonTheme textButtonTheme = theme.textButtonTheme;

    return YgButtonStyle(
      backgroundColor: textButtonTheme.backgroundColor,
      textStyle: textButtonTheme.textStyle,
      disabledTextStyle: textButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: textButtonTheme.borderGradient,
        borderRadius: theme.borderRadius,
        width: theme.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: textButtonTheme.disabledBorderGradient,
        borderRadius: theme.borderRadius,
        width: theme.borderWidth,
      ),
      padding: YgButtonMapper.buildPadding(
        theme: theme,
        size: size,
      ),
      iconColor: context.defaults.iconColor,
      disabledIconColor: context.defaults.invertedIconColor,
    );
  }

  static YgButtonStyle _buildLinkButton({
    required BuildContext context,
    required YgButtonSize size,
  }) {
    final YgButtonTheme theme = context.buttonTheme;
    final LinkButtonTheme linkButtonTheme = theme.linkButtonTheme;

    return YgButtonStyle(
      backgroundColor: linkButtonTheme.backgroundColor,
      textStyle: linkButtonTheme.textStyle,
      disabledTextStyle: linkButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: linkButtonTheme.borderGradient,
        borderRadius: theme.borderRadius,
        width: theme.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: linkButtonTheme.disabledBorderGradient,
        borderRadius: theme.borderRadius,
        width: theme.borderWidth,
      ),
      padding: YgButtonMapper.buildPadding(
        theme: theme,
        size: size,
      ),
      iconColor: context.defaults.iconColor,
      disabledIconColor: context.defaults.invertedIconColor,
    );
  }

  static YgButtonStyle _buildCriticalButton({
    required BuildContext context,
    required YgButtonSize size,
  }) {
    final YgButtonTheme theme = context.buttonTheme;
    final CriticalButtonTheme criticalButtonTheme = theme.criticalButtonTheme;

    return YgButtonStyle(
      backgroundColor: criticalButtonTheme.backgroundColor,
      textStyle: criticalButtonTheme.textStyle,
      disabledTextStyle: criticalButtonTheme.disabledTextStyle,
      shape: YgRoundedRectangleGradientBorder(
        gradient: criticalButtonTheme.borderGradient,
        borderRadius: theme.borderRadius,
        width: theme.borderWidth,
      ),
      disabledShape: YgRoundedRectangleGradientBorder(
        gradient: criticalButtonTheme.disabledBorderGradient,
        borderRadius: theme.borderRadius,
        width: theme.borderWidth,
      ),
      padding: YgButtonMapper.buildPadding(
        theme: theme,
        size: size,
      ),
      iconColor: context.defaults.iconColor,
      disabledIconColor: context.defaults.invertedIconColor,
    );
  }
}
