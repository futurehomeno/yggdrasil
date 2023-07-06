import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

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
        return _buildNeutralTag(
          context: context,
          size: size,
          impact: impact,
        );
      case YgTagVariant.informative:
        return _buildInformativeTag(
          context: context,
          size: size,
          impact: impact,
        );
      case YgTagVariant.positive:
        return _buildPositiveTag(
          context: context,
          size: size,
          impact: impact,
        );
      case YgTagVariant.warning:
        return _buildWarningTag(
          context: context,
          size: size,
          impact: impact,
        );
      case YgTagVariant.negative:
        return _buildNegativeTag(
          context: context,
          size: size,
          impact: impact,
        );
    }
  }

  static YgTagStyle _buildNeutralTag({
    required BuildContext context,
    required YgTagSize size,
    required YgTagImpact impact,
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

  static YgTagStyle _buildInformativeTag({
    required BuildContext context,
    required YgTagSize size,
    required YgTagImpact impact,
  }) {
    return YgTagStyle(
      backgroundColor: impact == YgTagImpact.weak
          ? context.tagThemes.informativeTagTheme.backgroundColor
          : context.tagThemes.informativeTagTheme.strongBackgroundColor,
      textStyle: impact == YgTagImpact.weak
          ? context.tagThemes.informativeTagTheme.textStyle
          : context.tagThemes.informativeTagTheme.strongTextStyle,
      disabledTextStyle: context.tagThemes.informativeTagTheme.disabledTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: context.tagThemes.borderRadius,
      ),
      disabledShape: RoundedRectangleBorder(
        borderRadius: context.tagThemes.borderRadius,
      ),
      padding: size.buildPadding(context),
    );
  }

  static YgTagStyle _buildPositiveTag({
    required BuildContext context,
    required YgTagSize size,
    required YgTagImpact impact,
  }) {
    return YgTagStyle(
      backgroundColor: impact == YgTagImpact.weak
          ? context.tagThemes.positiveTagTheme.backgroundColor
          : context.tagThemes.positiveTagTheme.strongBackgroundColor,
      textStyle: impact == YgTagImpact.weak
          ? context.tagThemes.positiveTagTheme.textStyle
          : context.tagThemes.positiveTagTheme.strongTextStyle,
      disabledTextStyle: context.tagThemes.positiveTagTheme.disabledTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: context.tagThemes.borderRadius,
      ),
      disabledShape: RoundedRectangleBorder(
        borderRadius: context.tagThemes.borderRadius,
      ),
      padding: size.buildPadding(context),
    );
  }

  static YgTagStyle _buildWarningTag({
    required BuildContext context,
    required YgTagSize size,
    required YgTagImpact impact,
  }) {
    return YgTagStyle(
      backgroundColor: impact == YgTagImpact.weak
          ? context.tagThemes.warningTagTheme.backgroundColor
          : context.tagThemes.warningTagTheme.strongBackgroundColor,
      textStyle: impact == YgTagImpact.weak
          ? context.tagThemes.warningTagTheme.textStyle
          : context.tagThemes.warningTagTheme.strongTextStyle,
      disabledTextStyle: context.tagThemes.warningTagTheme.disabledTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: context.tagThemes.borderRadius,
      ),
      disabledShape: RoundedRectangleBorder(
        borderRadius: context.tagThemes.borderRadius,
      ),
      padding: size.buildPadding(context),
    );
  }

  static YgTagStyle _buildNegativeTag({
    required BuildContext context,
    required YgTagSize size,
    required YgTagImpact impact,
  }) {
    return YgTagStyle(
      backgroundColor: impact == YgTagImpact.weak
          ? context.tagThemes.negativeTagTheme.backgroundColor
          : context.tagThemes.negativeTagTheme.strongBackgroundColor,
      textStyle: impact == YgTagImpact.weak
          ? context.tagThemes.negativeTagTheme.textStyle
          : context.tagThemes.negativeTagTheme.strongTextStyle,
      disabledTextStyle: context.tagThemes.negativeTagTheme.disabledTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: context.tagThemes.borderRadius,
      ),
      disabledShape: RoundedRectangleBorder(
        borderRadius: context.tagThemes.borderRadius,
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
