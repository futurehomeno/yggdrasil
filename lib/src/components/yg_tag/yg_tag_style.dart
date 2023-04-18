import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

import 'enums/_enums.dart';
import 'properties/_properties.dart';

/// Tag style for YgTags.
///
/// Variation of the [ButtonStyle] to better fit [YgTags].
/// Use [toButtonStyle] to convert to material [ButtonStyle].
class YgTagStyle {
  const YgTagStyle({
    required this.backgroundColor,
    required this.textStyle,
    required this.disabledTextStyle,
    required this.shape,
    required this.disabledShape,
    required this.padding,
  });

  factory YgTagStyle.fromVariant({
    required BuildContext context,
    required YgTagVariant variant,
    YgTagSize size = YgTagSize.medium,
    YgTagImpact impact = YgTagImpact.weak,
  }) {
    switch (variant) {
      case YgTagVariant.neutral:
        return YgTagStyle.neutral(
          context: context,
          size: size,
          impact: impact,
        );
      case YgTagVariant.informative:
        return YgTagStyle.informative(
          context: context,
          size: size,
          impact: impact,
        );
      case YgTagVariant.positive:
        return YgTagStyle.positive(
          context: context,
          size: size,
          impact: impact,
        );
      case YgTagVariant.warning:
        return YgTagStyle.warning(
          context: context,
          size: size,
          impact: impact,
        );
      case YgTagVariant.negative:
        return YgTagStyle.negative(
          context: context,
          size: size,
          impact: impact,
        );
    }
  }

  factory YgTagStyle.neutral({
    required BuildContext context,
    YgTagSize size = YgTagSize.medium,
    YgTagImpact impact = YgTagImpact.weak,
  }) {
    return YgTagStyle(
      backgroundColor: impact == YgTagImpact.weak
          ? context.tagThemes.neutralTagTheme.backgroundColor
          : context.tagThemes.neutralTagTheme.strongBackgroundColor,
      textStyle: impact == YgTagImpact.weak
          ? context.tagThemes.neutralTagTheme.textStyle
          : context.tagThemes.neutralTagTheme.strongTextStyle,
      disabledTextStyle: context.tagThemes.neutralTagTheme.disabledTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: context.tagThemes.borderRadius,
      ),
      disabledShape: RoundedRectangleBorder(
        borderRadius: context.tagThemes.borderRadius,
      ),
      padding: size.buildPadding(context),
    );
  }

  factory YgTagStyle.informative({
    required BuildContext context,
    YgTagSize size = YgTagSize.medium,
    YgTagImpact impact = YgTagImpact.weak,
  }) {
    return YgTagStyle(
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

  factory YgTagStyle.positive({
    required BuildContext context,
    YgTagSize size = YgTagSize.medium,
    YgTagImpact impact = YgTagImpact.weak,
  }) {
    return YgTagStyle(
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

  factory YgTagStyle.warning({
    required BuildContext context,
    YgTagSize size = YgTagSize.medium,
    YgTagImpact impact = YgTagImpact.weak,
  }) {
    return YgTagStyle(
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

  factory YgTagStyle.negative({
    required BuildContext context,
    YgTagSize size = YgTagSize.medium,
    YgTagImpact impact = YgTagImpact.weak,
  }) {
    return YgTagStyle(
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
      textStyle: YgTagTextStyleProperty(
        textStyle: textStyle,
        disabled: disabledTextStyle,
      ),
      shape: YgTagOutlinedBorderProperty(
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
      mouseCursor: YgTagMouseCursorProperty(
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
