import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'text_button_theme.tailor.dart';

@tailorComponent
class _$TextButtonTheme {
  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundTransparent,
    consumer_dark.FhColors.backgroundTransparent,
    professional_light.FhColors.backgroundTransparent,
    professional_dark.FhColors.backgroundTransparent,
  ];

  static const List<TextStyle> textStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Bold.copyWith(
      color: consumer_light.FhColors.textWarning,
    ),
    consumer_dark.FhTextStyles.paragraph3Bold.copyWith(
      color: consumer_dark.FhColors.textWarning,
    ),
    professional_light.FhTextStyles.paragraph3Bold.copyWith(
      color: professional_light.FhColors.textWarning,
    ),
    professional_dark.FhTextStyles.paragraph3Bold.copyWith(
      color: professional_dark.FhColors.textWarning,
    ),
  ];

  static const List<TextStyle> disabledTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Bold.copyWith(
      color: consumer_light.FhColors.textDisabled,
    ),
    consumer_dark.FhTextStyles.paragraph3Bold.copyWith(
      color: consumer_dark.FhColors.textDisabled,
    ),
    professional_light.FhTextStyles.paragraph3Bold.copyWith(
      color: professional_light.FhColors.textDisabled,
    ),
    professional_dark.FhTextStyles.paragraph3Bold.copyWith(
      color: professional_dark.FhColors.textDisabled,
    ),
  ];

  static const List<LinearGradient> borderGradient = <LinearGradient>[
    consumer_light.FhGradients.transparent,
    consumer_dark.FhGradients.transparent,
    professional_light.FhGradients.transparent,
    professional_dark.FhGradients.transparent,
  ];

  static const List<LinearGradient> disabledBorderGradient = <LinearGradient>[
    consumer_light.FhGradients.transparent,
    consumer_dark.FhGradients.transparent,
    professional_light.FhGradients.transparent,
    professional_dark.FhGradients.transparent,
  ];

  static const List<Color> iconDefaultColor = <Color>[
    consumer_light.FhColors.iconWarning,
    consumer_dark.FhColors.iconWarning,
    professional_light.FhColors.iconWarning,
    professional_dark.FhColors.iconWarning,
  ];

  static const List<Color> iconDisabledColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];
}
