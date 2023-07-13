import 'package:flutter/material.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'enums/_enums.dart';
import 'properties/_properties.dart';

/// Tag style for YgTags.
///
/// Variation of the [ButtonStyle] to better fit [YgTags].
/// Use [toButtonStyle] to convert to material [ButtonStyle].
// TODO(bjhandeland): Find a way to improve this. Too much repeated code.
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
    YgTagWeight weight = YgTagWeight.weak,
  }) {
    switch (variant) {
      case YgTagVariant.neutral:
        final NeutralTagTheme theme = context.tagTheme.neutralTagTheme;

        return _buildTagStyle(
          backgroundColor: weight == YgTagWeight.weak ? theme.backgroundColor : theme.strongBackgroundColor,
          textStyle: weight == YgTagWeight.weak ? theme.textStyle : theme.strongTextStyle,
          disabledTextStyle: theme.disabledTextStyle,
          borderRadius: context.tagTheme.borderRadius,
          padding: size.buildPadding(context),
        );

      case YgTagVariant.informative:
        final InformativeTagTheme theme = context.tagTheme.informativeTagTheme;

        return _buildTagStyle(
          backgroundColor: weight == YgTagWeight.weak ? theme.backgroundColor : theme.strongBackgroundColor,
          textStyle: weight == YgTagWeight.weak ? theme.textStyle : theme.strongTextStyle,
          disabledTextStyle: theme.disabledTextStyle,
          borderRadius: context.tagTheme.borderRadius,
          padding: size.buildPadding(context),
        );
      case YgTagVariant.positive:
        final PositiveTagTheme theme = context.tagTheme.positiveTagTheme;

        return _buildTagStyle(
          backgroundColor: weight == YgTagWeight.weak ? theme.backgroundColor : theme.strongBackgroundColor,
          textStyle: weight == YgTagWeight.weak ? theme.textStyle : theme.strongTextStyle,
          disabledTextStyle: theme.disabledTextStyle,
          borderRadius: context.tagTheme.borderRadius,
          padding: size.buildPadding(context),
        );
      case YgTagVariant.warning:
        final WarningTagTheme theme = context.tagTheme.warningTagTheme;

        return _buildTagStyle(
          backgroundColor: weight == YgTagWeight.weak ? theme.backgroundColor : theme.strongBackgroundColor,
          textStyle: weight == YgTagWeight.weak ? theme.textStyle : theme.strongTextStyle,
          disabledTextStyle: theme.disabledTextStyle,
          borderRadius: context.tagTheme.borderRadius,
          padding: size.buildPadding(context),
        );
      case YgTagVariant.negative:
        final NegativeTagTheme theme = context.tagTheme.negativeTagTheme;

        return _buildTagStyle(
          backgroundColor: weight == YgTagWeight.weak ? theme.backgroundColor : theme.strongBackgroundColor,
          textStyle: weight == YgTagWeight.weak ? theme.textStyle : theme.strongTextStyle,
          disabledTextStyle: theme.disabledTextStyle,
          borderRadius: context.tagTheme.borderRadius,
          padding: size.buildPadding(context),
        );
    }
  }

  static YgTagStyle _buildTagStyle({
    required Color backgroundColor,
    required TextStyle textStyle,
    required TextStyle disabledTextStyle,
    required BorderRadius borderRadius,
    required EdgeInsets padding,
  }) {
    return YgTagStyle(
      backgroundColor: backgroundColor,
      textStyle: textStyle,
      disabledTextStyle: disabledTextStyle,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      disabledShape: RoundedRectangleBorder(borderRadius: borderRadius),
      padding: padding,
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
