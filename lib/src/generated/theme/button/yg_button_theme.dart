import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yggdrasil/src/generated/theme/extensions/_extensions.dart';
import 'package:yggdrasil/src/generated/theme/yg_theme.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

class YgButtonTheme extends ThemeExtension<YgButtonTheme> {
  const YgButtonTheme({
    required this.borderRadius,
    required this.borderWidth,
    required this.textStyle,
    required this.disabledTextColor,
    required this.iconDisabledColor,
    required this.iconSpacing,
  });

  final double borderRadius;
  final double borderWidth;
  final TextStyle textStyle;
  final Color disabledTextColor;
  final Color iconDisabledColor;
  final double iconSpacing;

  static const YgButtonTheme consumerDark = YgButtonTheme(
    borderRadius: consumer_dark.FhDimensions.xxl,
    borderWidth: 1,
    textStyle: consumer_dark.FhTextStyles.paragraph2Bold,
    disabledTextColor: consumer_dark.FhColors.textDisabled,
    iconDisabledColor: consumer_dark.FhColors.iconDisabled,
    iconSpacing: consumer_dark.FhDimensions.xxs,
  );

  static const YgButtonTheme consumerLight = YgButtonTheme(
    borderRadius: consumer_light.FhDimensions.xxl,
    borderWidth: 1,
    textStyle: consumer_light.FhTextStyles.paragraph2Bold,
    disabledTextColor: consumer_light.FhColors.textDisabled,
    iconDisabledColor: consumer_light.FhColors.iconDisabled,
    iconSpacing: consumer_light.FhDimensions.xxs,
  );

  static const YgButtonTheme professionalDark = YgButtonTheme(
    borderRadius: professional_dark.FhDimensions.xxl,
    borderWidth: 1,
    textStyle: professional_dark.FhTextStyles.paragraph2Bold,
    disabledTextColor: professional_dark.FhColors.textDisabled,
    iconDisabledColor: professional_dark.FhColors.iconDisabled,
    iconSpacing: professional_dark.FhDimensions.xxs,
  );

  static const YgButtonTheme professionalLight = YgButtonTheme(
    borderRadius: professional_light.FhDimensions.xxl,
    borderWidth: 1,
    textStyle: professional_light.FhTextStyles.paragraph2Bold,
    disabledTextColor: professional_light.FhColors.textDisabled,
    iconDisabledColor: professional_light.FhColors.iconDisabled,
    iconSpacing: professional_light.FhDimensions.xxs,
  );

  static YgButtonTheme fromJson(Map<String, dynamic> json, YgButtonTheme baseTheme) {
    return YgButtonTheme(
      borderRadius: json.safeValue('borderRadius') ?? baseTheme.borderRadius,
      borderWidth: json.safeValue('borderWidth') ?? baseTheme.borderWidth,
      textStyle: json.safeValue('textStyle') ?? baseTheme.textStyle,
      disabledTextColor: json.safeValue('disabledTextColor') ?? baseTheme.disabledTextColor,
      iconDisabledColor: json.safeValue('iconDisabledColor') ?? baseTheme.iconDisabledColor,
      iconSpacing: json.safeValue('iconSpacing') ?? baseTheme.iconSpacing,
    );
  }

  static YgButtonTheme of(BuildContext context) {
    return YgTheme.of(context).buttonTheme;
  }

  @override
  YgButtonTheme copyWith({
    double? borderRadius,
    double? borderWidth,
    TextStyle? textStyle,
    Color? disabledTextColor,
    Color? iconDisabledColor,
    double? iconSpacing,
  }) {
    return YgButtonTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      textStyle: textStyle ?? this.textStyle,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
      iconSpacing: iconSpacing ?? this.iconSpacing,
    );
  }

  @override
  YgButtonTheme lerp(covariant ThemeExtension<YgButtonTheme>? other, double t) {
    if (other is! YgButtonTheme) return this;

    return YgButtonTheme(
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      disabledTextColor: Color.lerp(disabledTextColor, other.disabledTextColor, t)!,
      iconDisabledColor: Color.lerp(iconDisabledColor, other.iconDisabledColor, t)!,
      iconSpacing: lerpDouble(iconSpacing, other.iconSpacing, t)!,
    );
  }
}
