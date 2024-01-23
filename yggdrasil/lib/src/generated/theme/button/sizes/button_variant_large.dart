import 'package:flutter/material.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

class ButtonVariantLarge extends ThemeExtension<ButtonVariantLarge> {
  const ButtonVariantLarge({
    required this.borderDefaultColor1,
    required this.borderDefaultColor2,
    required this.borderHoverColor1,
    required this.borderHoverColor2,
    required this.borderPressedColor1,
    required this.borderPressedColor2,
    required this.borderDisabledColor1,
    required this.borderDisabledColor2,
    required this.textDefaultColor,
    required this.iconDefaultColor,
  });

  final Color borderDefaultColor1;
  final Color borderDefaultColor2;
  final Color borderHoverColor1;
  final Color borderHoverColor2;
  final Color borderPressedColor1;
  final Color borderPressedColor2;
  final Color borderDisabledColor1;
  final Color borderDisabledColor2;
  final Color textDefaultColor;
  final Color iconDefaultColor;

  static const ButtonVariantLarge consumerDark = ButtonVariantLarge(
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

  static const ButtonVariantLarge consumerLight = ButtonVariantLarge(
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

  static const ButtonVariantLarge professionalDark = ButtonVariantLarge(
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

  static const ButtonVariantLarge professionalLight = ButtonVariantLarge(
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

  static const List<ButtonVariantLarge> themes = <ButtonVariantLarge>[ButtonVariantLarge()];

  @override
  ThemeExtension<ButtonVariantLarge> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ButtonVariantLarge> lerp(covariant ThemeExtension<ButtonVariantLarge>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}
