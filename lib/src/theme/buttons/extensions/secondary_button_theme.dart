import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'secondary_button_theme.tailor.dart';

@tailorComponent
class _$SecondaryButtonTheme {
  static List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundTransparent,
    consumer_dark.FhColors.backgroundTransparent,
    professional_light.FhColors.backgroundTransparent,
    professional_dark.FhColors.backgroundTransparent,
  ];

  static List<TextStyle> textStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Bold.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.paragraph3Bold.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.paragraph3Bold.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.paragraph3Bold.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  static List<TextStyle> disabledTextStyle = <TextStyle>[
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

  static List<LinearGradient> borderGradient = <LinearGradient>[
    consumer_light.FhGradients.actionSecondaryDefault,
    consumer_dark.FhGradients.actionSecondaryDefault,
    professional_light.FhGradients.actionSecondaryDefault,
    professional_dark.FhGradients.actionSecondaryDefault,
  ];

  static List<LinearGradient> disabledBorderGradient = <LinearGradient>[
    const LinearGradient(
      colors: <Color>[
        consumer_light.FhColors.actionSecondaryDisabled,
        consumer_light.FhColors.actionSecondaryDisabled,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        consumer_dark.FhColors.actionSecondaryDisabled,
        consumer_dark.FhColors.actionSecondaryDisabled,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        professional_light.FhColors.actionSecondaryDisabled,
        professional_light.FhColors.actionSecondaryDisabled,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        professional_dark.FhColors.actionSecondaryDisabled,
        professional_dark.FhColors.actionSecondaryDisabled,
      ],
    ),
  ];
}
