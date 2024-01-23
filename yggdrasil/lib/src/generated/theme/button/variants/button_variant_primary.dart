import 'package:flutter/material.dart';
import 'package:yggdrasil/src/generated/theme/extensions/_extensions.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'button_variant.dart';

class ButtonVariantPrimary extends ButtonVariant<ButtonVariantPrimary> {
  const ButtonVariantPrimary({
    required super.borderDefaultColor1,
    required super.borderDefaultColor2,
    required super.borderHoverColor1,
    required super.borderHoverColor2,
    required super.borderPressedColor1,
    required super.borderPressedColor2,
    required super.borderDisabledColor1,
    required super.borderDisabledColor2,
    required super.textDefaultColor,
    required super.iconDefaultColor,
  });

  static ButtonVariantPrimary fromJson(Map<String, dynamic> json, ButtonVariantPrimary baseTheme) {
    return ButtonVariantPrimary(
      borderDefaultColor1: json.safeColor('borderDefaultColor1') ?? baseTheme.borderDefaultColor1,
      borderDefaultColor2: json.safeColor('borderDefaultColor2') ?? baseTheme.borderDefaultColor2,
      borderHoverColor1: json.safeColor('borderHoverColor1') ?? baseTheme.borderHoverColor1,
      borderHoverColor2: json.safeColor('borderHoverColor2') ?? baseTheme.borderHoverColor2,
      borderPressedColor1: json.safeColor('borderPressedColor1') ?? baseTheme.borderPressedColor1,
      borderPressedColor2: json.safeColor('borderPressedColor2') ?? baseTheme.borderPressedColor2,
      borderDisabledColor1: json.safeColor('borderDisabledColor1') ?? baseTheme.borderDisabledColor1,
      borderDisabledColor2: json.safeColor('borderDisabledColor2') ?? baseTheme.borderDisabledColor2,
      textDefaultColor: json.safeColor('textDefaultColor') ?? baseTheme.textDefaultColor,
      iconDefaultColor: json.safeColor('iconDefaultColor') ?? baseTheme.iconDefaultColor,
    );
  }

  static const ButtonVariantPrimary consumerDark = ButtonVariantPrimary(
    borderDefaultColor1: consumer_dark.FhColors.backgroundSuccessDefault,
    borderDefaultColor2: consumer_dark.FhColors.borderHighlightDefault,
    borderHoverColor1: consumer_dark.FhColors.borderSuccessWeak,
    borderHoverColor2: consumer_dark.FhColors.interactiveHighlightHovered,
    borderPressedColor1: consumer_dark.FhColors.borderSuccessWeak,
    borderPressedColor2: consumer_dark.FhColors.interactiveHighlightHovered,
    borderDisabledColor1: consumer_dark.FhColors.borderTransparent,
    borderDisabledColor2: consumer_dark.FhColors.borderTransparent,
    textDefaultColor: consumer_dark.FhColors.textDefault,
    iconDefaultColor: consumer_dark.FhColors.iconDefault,
  );

  static const ButtonVariantPrimary consumerLight = ButtonVariantPrimary(
    borderDefaultColor1: consumer_light.FhColors.backgroundSuccessDefault,
    borderDefaultColor2: consumer_light.FhColors.borderHighlightDefault,
    borderHoverColor1: consumer_light.FhColors.borderSuccessWeak,
    borderHoverColor2: consumer_light.FhColors.interactiveHighlightHovered,
    borderPressedColor1: consumer_light.FhColors.borderSuccessWeak,
    borderPressedColor2: consumer_light.FhColors.interactiveHighlightHovered,
    borderDisabledColor1: consumer_light.FhColors.borderTransparent,
    borderDisabledColor2: consumer_light.FhColors.borderTransparent,
    textDefaultColor: consumer_light.FhColors.textDefault,
    iconDefaultColor: consumer_light.FhColors.iconDefault,
  );

  static const ButtonVariantPrimary professionalDark = ButtonVariantPrimary(
    borderDefaultColor1: professional_dark.FhColors.backgroundSuccessDefault,
    borderDefaultColor2: professional_dark.FhColors.borderHighlightDefault,
    borderHoverColor1: professional_dark.FhColors.borderSuccessWeak,
    borderHoverColor2: professional_dark.FhColors.interactiveHighlightHovered,
    borderPressedColor1: professional_dark.FhColors.borderSuccessWeak,
    borderPressedColor2: professional_dark.FhColors.interactiveHighlightHovered,
    borderDisabledColor1: professional_dark.FhColors.borderTransparent,
    borderDisabledColor2: professional_dark.FhColors.borderTransparent,
    textDefaultColor: professional_dark.FhColors.textDefault,
    iconDefaultColor: professional_dark.FhColors.iconDefault,
  );

  static const ButtonVariantPrimary professionalLight = ButtonVariantPrimary(
    borderDefaultColor1: professional_light.FhColors.backgroundSuccessDefault,
    borderDefaultColor2: professional_light.FhColors.borderHighlightDefault,
    borderHoverColor1: professional_light.FhColors.borderSuccessWeak,
    borderHoverColor2: professional_light.FhColors.interactiveHighlightHovered,
    borderPressedColor1: professional_light.FhColors.borderSuccessWeak,
    borderPressedColor2: professional_light.FhColors.interactiveHighlightHovered,
    borderDisabledColor1: professional_light.FhColors.borderTransparent,
    borderDisabledColor2: professional_light.FhColors.borderTransparent,
    textDefaultColor: professional_light.FhColors.textDefault,
    iconDefaultColor: professional_light.FhColors.iconDefault,
  );

  @override
  ButtonVariantPrimary copyWith({
    Color? borderDefaultColor1,
    Color? borderDefaultColor2,
    Color? borderHoverColor1,
    Color? borderHoverColor2,
    Color? borderPressedColor1,
    Color? borderPressedColor2,
    Color? borderDisabledColor1,
    Color? borderDisabledColor2,
    Color? textDefaultColor,
    Color? iconDefaultColor,
  }) {
    return ButtonVariantPrimary(
      borderDefaultColor1: borderDefaultColor1 ?? this.borderDefaultColor1,
      borderDefaultColor2: borderDefaultColor2 ?? this.borderDefaultColor2,
      borderHoverColor1: borderHoverColor1 ?? this.borderHoverColor1,
      borderHoverColor2: borderHoverColor2 ?? this.borderHoverColor2,
      borderPressedColor1: borderPressedColor1 ?? this.borderPressedColor1,
      borderPressedColor2: borderPressedColor2 ?? this.borderPressedColor2,
      borderDisabledColor1: borderDisabledColor1 ?? this.borderDisabledColor1,
      borderDisabledColor2: borderDisabledColor2 ?? this.borderDisabledColor2,
      textDefaultColor: textDefaultColor ?? this.textDefaultColor,
      iconDefaultColor: iconDefaultColor ?? this.iconDefaultColor,
    );
  }

  @override
  ButtonVariantPrimary lerp(covariant ThemeExtension<ButtonVariantPrimary>? other, double t) {
    if (other is! ButtonVariantPrimary) return this;

    return ButtonVariantPrimary(
      borderDefaultColor1: Color.lerp(borderDefaultColor1, other.borderDefaultColor1, t)!,
      borderDefaultColor2: Color.lerp(borderDefaultColor2, other.borderDefaultColor2, t)!,
      borderHoverColor1: Color.lerp(borderHoverColor1, other.borderHoverColor1, t)!,
      borderHoverColor2: Color.lerp(borderHoverColor2, other.borderHoverColor2, t)!,
      borderPressedColor1: Color.lerp(borderPressedColor1, other.borderPressedColor1, t)!,
      borderPressedColor2: Color.lerp(borderPressedColor2, other.borderPressedColor2, t)!,
      borderDisabledColor1: Color.lerp(borderDisabledColor1, other.borderDisabledColor1, t)!,
      borderDisabledColor2: Color.lerp(borderDisabledColor2, other.borderDisabledColor2, t)!,
      textDefaultColor: Color.lerp(textDefaultColor, other.textDefaultColor, t)!,
      iconDefaultColor: Color.lerp(iconDefaultColor, other.iconDefaultColor, t)!,
    );
  }
}
