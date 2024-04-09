import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'primary_button_theme.tailor.dart';

@tailorComponent
class _$YgPrimaryButtonTheme {
  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundTransparent,
    consumer_dark.FhColors.backgroundTransparent,
    professional_light.FhColors.backgroundTransparent,
    professional_dark.FhColors.backgroundTransparent,
  ];

  static final List<TextStyle> textStyle = <TextStyle>[
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

  static final List<TextStyle> disabledTextStyle = <TextStyle>[
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
    consumer_light.FhGradients.actionPrimaryDefault,
    consumer_dark.FhGradients.actionPrimaryDefault,
    professional_light.FhGradients.actionPrimaryDefault,
    professional_dark.FhGradients.actionPrimaryDefault,
  ];

  static const List<LinearGradient> disabledBorderGradient = <LinearGradient>[
    LinearGradient(
      colors: <Color>[
        consumer_light.FhColors.actionPrimaryDisabled,
        consumer_light.FhColors.actionPrimaryDisabled,
      ],
    ),
    LinearGradient(
      colors: <Color>[
        consumer_dark.FhColors.actionPrimaryDisabled,
        consumer_dark.FhColors.actionPrimaryDisabled,
      ],
    ),
    LinearGradient(
      colors: <Color>[
        professional_light.FhColors.actionPrimaryDisabled,
        professional_light.FhColors.actionPrimaryDisabled,
      ],
    ),
    LinearGradient(
      colors: <Color>[
        professional_dark.FhColors.actionPrimaryDisabled,
        professional_dark.FhColors.actionPrimaryDisabled,
      ],
    ),
  ];

  static const List<Color> iconDefaultColor = <Color>[
    consumer_light.FhColors.iconDefault,
    consumer_dark.FhColors.iconDefault,
    professional_light.FhColors.iconDefault,
    professional_dark.FhColors.iconDefault,
  ];

  static const List<Color> iconDisabledColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];
}
