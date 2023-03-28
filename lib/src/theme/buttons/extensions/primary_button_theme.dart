import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart'
    as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart'
    as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart'
    as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart'
    as professional_light;

part 'primary_button_theme.tailor.dart';

@tailorComponent
class _$PrimaryButtonTheme {
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

  static List<double> borderWidth = <double>[
    consumer_light.FhBorders.sm.left.width,
    consumer_dark.FhBorders.sm.left.width,
    professional_light.FhBorders.sm.left.width,
    professional_dark.FhBorders.sm.left.width,
  ];

  static List<Gradient> borderGradient = <Gradient>[
    consumer_light.FhGradients.actionPrimaryDefault,
    consumer_dark.FhGradients.actionPrimaryDefault,
    professional_light.FhGradients.actionPrimaryDefault,
    professional_dark.FhGradients.actionPrimaryDefault,
  ];

  static List<LinearGradient> disabledBorderGradient = <LinearGradient>[
    const LinearGradient(
      colors: <Color>[
        consumer_light.FhColors.actionPrimaryDisabled,
        consumer_light.FhColors.actionPrimaryDisabled,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        consumer_dark.FhColors.actionPrimaryDisabled,
        consumer_dark.FhColors.actionPrimaryDisabled,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        professional_light.FhColors.actionPrimaryDisabled,
        professional_light.FhColors.actionPrimaryDisabled,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        professional_dark.FhColors.actionPrimaryDisabled,
        professional_dark.FhColors.actionPrimaryDisabled,
      ],
    ),
  ];

  static List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];
}
