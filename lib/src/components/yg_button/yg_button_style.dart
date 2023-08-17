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
    required this.iconSize,
    required this.iconColor,
    required this.iconDisabledColor,
    required this.shape,
    required this.disabledShape,
    required this.padding,
  });

  factory YgButtonStyle.fromVariant({
    required BuildContext context,
    required YgButtonVariant variant,
    required YgButtonSize size,
  }) {
    final YgButtonTheme buttonTheme = context.buttonTheme;

    switch (variant) {
      case YgButtonVariant.primary:
        final PrimaryButtonTheme theme = context.buttonTheme.primaryButtonTheme;

        return _buildButtonStyle(
          backgroundColor: theme.backgroundColor,
          textStyle: theme.textStyle,
          disabledTextStyle: theme.disabledTextStyle,
          shape: YgRoundedRectangleGradientBorder(
            gradient: theme.borderGradient,
            borderRadius: buttonTheme.borderRadius,
            width: buttonTheme.borderWidth,
          ),
          disabledShape: YgRoundedRectangleGradientBorder(
            gradient: theme.disabledBorderGradient,
            borderRadius: buttonTheme.borderRadius,
            width: buttonTheme.borderWidth,
          ),
          padding: YgButtonMapper.buildPadding(
            theme: buttonTheme,
            size: size,
          ),
          iconSize: context.buttonTheme.iconSize,
          iconColor: theme.iconDefaultColor,
          iconDisabledColor: theme.iconDisabledColor,
        );

      case YgButtonVariant.secondary:
        final SecondaryButtonTheme theme = context.buttonTheme.secondaryButtonTheme;

        return _buildButtonStyle(
          backgroundColor: theme.backgroundColor,
          textStyle: theme.textStyle,
          disabledTextStyle: theme.disabledTextStyle,
          shape: YgRoundedRectangleGradientBorder(
            gradient: theme.borderGradient,
            borderRadius: buttonTheme.borderRadius,
            width: buttonTheme.borderWidth,
          ),
          disabledShape: YgRoundedRectangleGradientBorder(
            gradient: theme.disabledBorderGradient,
            borderRadius: buttonTheme.borderRadius,
            width: buttonTheme.borderWidth,
          ),
          padding: YgButtonMapper.buildPadding(
            theme: buttonTheme,
            size: size,
          ),
          iconSize: context.buttonTheme.iconSize,
          iconColor: theme.iconDefaultColor,
          iconDisabledColor: theme.iconDisabledColor,
        );

      case YgButtonVariant.text:
        final TextButtonTheme theme = context.buttonTheme.textButtonTheme;

        return _buildButtonStyle(
          backgroundColor: theme.backgroundColor,
          textStyle: theme.textStyle,
          disabledTextStyle: theme.disabledTextStyle,
          shape: YgRoundedRectangleGradientBorder(
            gradient: theme.borderGradient,
            borderRadius: buttonTheme.borderRadius,
            width: buttonTheme.borderWidth,
          ),
          disabledShape: YgRoundedRectangleGradientBorder(
            gradient: theme.disabledBorderGradient,
            borderRadius: buttonTheme.borderRadius,
            width: buttonTheme.borderWidth,
          ),
          padding: YgButtonMapper.buildPadding(
            theme: buttonTheme,
            size: size,
          ),
          iconSize: context.buttonTheme.iconSize,
          iconColor: theme.iconDefaultColor,
          iconDisabledColor: theme.iconDisabledColor,
        );

      case YgButtonVariant.link:
        final LinkButtonTheme theme = context.buttonTheme.linkButtonTheme;

        return _buildButtonStyle(
          backgroundColor: theme.backgroundColor,
          textStyle: theme.textStyle,
          disabledTextStyle: theme.disabledTextStyle,
          shape: YgRoundedRectangleGradientBorder(
            gradient: theme.borderGradient,
            borderRadius: buttonTheme.borderRadius,
            width: buttonTheme.borderWidth,
          ),
          disabledShape: YgRoundedRectangleGradientBorder(
            gradient: theme.disabledBorderGradient,
            borderRadius: buttonTheme.borderRadius,
            width: buttonTheme.borderWidth,
          ),
          padding: YgButtonMapper.buildPadding(
            theme: buttonTheme,
            size: size,
          ),
          iconSize: context.buttonTheme.iconSize,
          iconColor: theme.iconDefaultColor,
          iconDisabledColor: theme.iconDisabledColor,
        );

      case YgButtonVariant.critical:
        final CriticalButtonTheme theme = context.buttonTheme.criticalButtonTheme;

        return _buildButtonStyle(
          backgroundColor: theme.backgroundColor,
          textStyle: theme.textStyle,
          disabledTextStyle: theme.disabledTextStyle,
          shape: YgRoundedRectangleGradientBorder(
            gradient: theme.borderGradient,
            borderRadius: buttonTheme.borderRadius,
            width: buttonTheme.borderWidth,
          ),
          disabledShape: YgRoundedRectangleGradientBorder(
            gradient: theme.disabledBorderGradient,
            borderRadius: buttonTheme.borderRadius,
            width: buttonTheme.borderWidth,
          ),
          padding: YgButtonMapper.buildPadding(
            theme: buttonTheme,
            size: size,
          ),
          iconSize: context.buttonTheme.iconSize,
          iconColor: theme.iconDefaultColor,
          iconDisabledColor: theme.iconDisabledColor,
        );
    }
  }

  static YgButtonStyle _buildButtonStyle({
    required Color backgroundColor,
    required TextStyle textStyle,
    required TextStyle disabledTextStyle,
    required double iconSize,
    required Color iconColor,
    required Color iconDisabledColor,
    required OutlinedBorder shape,
    required OutlinedBorder disabledShape,
    required EdgeInsets padding,
  }) {
    return YgButtonStyle(
      backgroundColor: backgroundColor,
      textStyle: textStyle,
      disabledTextStyle: disabledTextStyle,
      iconSize: iconSize,
      iconColor: iconColor,
      iconDisabledColor: iconDisabledColor,
      shape: shape,
      disabledShape: disabledShape,
      padding: padding,
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
      iconColor: YgButtonIconColorProperty(
        color: iconColor,
        disabled: iconDisabledColor,
      ),
      iconSize: ButtonStyleButton.allOrNull(iconSize),
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
  final double iconSize;
  final Color iconColor;
  final Color iconDisabledColor;
  final OutlinedBorder shape;
  final OutlinedBorder disabledShape;
  final EdgeInsets padding;
}
