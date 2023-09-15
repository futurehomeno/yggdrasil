import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/yg_tag/_yg_tag.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

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
    required this.iconSize,
    required this.iconColor,
    required this.iconDisabledColor,
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
    final YgTagTheme ygTagTheme = context.tagTheme;

    switch (variant) {
      case YgTagVariant.neutral:
        final NeutralTagTheme neutralTagTheme = ygTagTheme.neutralTagTheme;

        return _buildTagStyle(
          backgroundColor:
              weight == YgTagWeight.weak ? neutralTagTheme.backgroundColor : neutralTagTheme.strongBackgroundColor,
          textStyle: weight == YgTagWeight.weak ? ygTagTheme.textStyle : ygTagTheme.strongTextStyle,
          disabledTextStyle:
              weight == YgTagWeight.weak ? ygTagTheme.disabledTextStyle : ygTagTheme.disabledStrongTextStyle,
          iconSize: ygTagTheme.iconSize,
          iconColor: weight == YgTagWeight.weak ? ygTagTheme.iconWeakColor : ygTagTheme.iconStrongColor,
          iconDisabledColor:
              weight == YgTagWeight.weak ? ygTagTheme.iconWeakDisabledColor : ygTagTheme.iconStrongDisabledColor,
          borderRadius: ygTagTheme.borderRadius,
          padding: YgTagMapper.buildPadding(
            context: context,
            tagSize: size,
          ),
        );

      case YgTagVariant.informative:
        final InformativeTagTheme informativeTagTheme = ygTagTheme.informativeTagTheme;

        return _buildTagStyle(
          backgroundColor: weight == YgTagWeight.weak
              ? informativeTagTheme.backgroundColor
              : informativeTagTheme.strongBackgroundColor,
          textStyle: weight == YgTagWeight.weak ? ygTagTheme.textStyle : ygTagTheme.strongTextStyle,
          disabledTextStyle:
              weight == YgTagWeight.weak ? ygTagTheme.disabledTextStyle : ygTagTheme.disabledStrongTextStyle,
          iconSize: ygTagTheme.iconSize,
          iconColor: weight == YgTagWeight.weak ? ygTagTheme.iconWeakColor : ygTagTheme.iconStrongColor,
          iconDisabledColor:
              weight == YgTagWeight.weak ? ygTagTheme.iconWeakDisabledColor : ygTagTheme.iconStrongDisabledColor,
          borderRadius: ygTagTheme.borderRadius,
          padding: YgTagMapper.buildPadding(
            context: context,
            tagSize: size,
          ),
        );

      case YgTagVariant.positive:
        final PositiveTagTheme positiveTagTheme = ygTagTheme.positiveTagTheme;

        return _buildTagStyle(
          backgroundColor:
              weight == YgTagWeight.weak ? positiveTagTheme.backgroundColor : positiveTagTheme.strongBackgroundColor,
          textStyle: weight == YgTagWeight.weak ? ygTagTheme.textStyle : ygTagTheme.strongTextStyle,
          disabledTextStyle:
              weight == YgTagWeight.weak ? ygTagTheme.disabledTextStyle : ygTagTheme.disabledStrongTextStyle,
          iconSize: ygTagTheme.iconSize,
          iconColor: weight == YgTagWeight.weak ? ygTagTheme.iconWeakColor : ygTagTheme.iconStrongColor,
          iconDisabledColor:
              weight == YgTagWeight.weak ? ygTagTheme.iconWeakDisabledColor : ygTagTheme.iconStrongDisabledColor,
          borderRadius: ygTagTheme.borderRadius,
          padding: YgTagMapper.buildPadding(
            context: context,
            tagSize: size,
          ),
        );

      case YgTagVariant.warning:
        final WarningTagTheme warningTagTheme = ygTagTheme.warningTagTheme;

        return _buildTagStyle(
          backgroundColor:
              weight == YgTagWeight.weak ? warningTagTheme.backgroundColor : warningTagTheme.strongBackgroundColor,
          textStyle: weight == YgTagWeight.weak ? ygTagTheme.textStyle : ygTagTheme.strongTextStyle,
          disabledTextStyle:
              weight == YgTagWeight.weak ? ygTagTheme.disabledTextStyle : ygTagTheme.disabledStrongTextStyle,
          iconSize: ygTagTheme.iconSize,
          iconColor: weight == YgTagWeight.weak ? ygTagTheme.iconWeakColor : ygTagTheme.iconStrongColor,
          iconDisabledColor:
              weight == YgTagWeight.weak ? ygTagTheme.iconWeakDisabledColor : ygTagTheme.iconStrongDisabledColor,
          borderRadius: ygTagTheme.borderRadius,
          padding: YgTagMapper.buildPadding(
            context: context,
            tagSize: size,
          ),
        );

      case YgTagVariant.negative:
        final NegativeTagTheme negativeTagTheme = ygTagTheme.negativeTagTheme;

        return _buildTagStyle(
          backgroundColor:
              weight == YgTagWeight.weak ? negativeTagTheme.backgroundColor : negativeTagTheme.strongBackgroundColor,
          textStyle: weight == YgTagWeight.weak ? ygTagTheme.textStyle : ygTagTheme.strongTextStyle,
          disabledTextStyle:
              weight == YgTagWeight.weak ? ygTagTheme.disabledTextStyle : ygTagTheme.disabledStrongTextStyle,
          iconSize: ygTagTheme.iconSize,
          iconColor: weight == YgTagWeight.weak ? ygTagTheme.iconWeakColor : ygTagTheme.iconStrongColor,
          iconDisabledColor:
              weight == YgTagWeight.weak ? ygTagTheme.iconWeakDisabledColor : ygTagTheme.iconStrongDisabledColor,
          borderRadius: ygTagTheme.borderRadius,
          padding: YgTagMapper.buildPadding(
            context: context,
            tagSize: size,
          ),
        );
    }
  }

  static YgTagStyle _buildTagStyle({
    required Color backgroundColor,
    required TextStyle textStyle,
    required TextStyle disabledTextStyle,
    required double iconSize,
    required Color iconColor,
    required Color iconDisabledColor,
    required BorderRadius borderRadius,
    required EdgeInsets padding,
  }) {
    return YgTagStyle(
      backgroundColor: backgroundColor,
      textStyle: textStyle,
      disabledTextStyle: disabledTextStyle,
      iconSize: iconSize,
      iconColor: iconColor,
      iconDisabledColor: iconDisabledColor,
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
      iconColor: YgTagIconColorProperty(
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
      splashFactory: InkRipple.splashFactory,
      mouseCursor: YgTagMouseCursorProperty(
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
