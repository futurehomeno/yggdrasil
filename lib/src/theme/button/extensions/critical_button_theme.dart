import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'critical_button_theme.tailor.dart';

@tailorComponent
class _$CriticalButtonTheme {
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
    const LinearGradient(
      colors: <Color>[
        consumer_light.FhColors.actionCriticalDefault,
        consumer_light.FhColors.actionCriticalDefault,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        consumer_dark.FhColors.actionCriticalDefault,
        consumer_dark.FhColors.actionCriticalDefault,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        professional_light.FhColors.actionCriticalDefault,
        professional_light.FhColors.actionCriticalDefault,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        professional_dark.FhColors.actionCriticalDefault,
        professional_dark.FhColors.actionCriticalDefault,
      ],
    ),
  ];

  static List<LinearGradient> disabledBorderGradient = <LinearGradient>[
    const LinearGradient(
      colors: <Color>[
        consumer_light.FhColors.actionCriticalDisabled,
        consumer_light.FhColors.actionCriticalDisabled,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        consumer_dark.FhColors.actionCriticalDisabled,
        consumer_dark.FhColors.actionCriticalDisabled,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        professional_light.FhColors.actionCriticalDisabled,
        professional_light.FhColors.actionCriticalDisabled,
      ],
    ),
    const LinearGradient(
      colors: <Color>[
        professional_dark.FhColors.actionCriticalDisabled,
        professional_dark.FhColors.actionCriticalDisabled,
      ],
    ),
  ];

  static List<Color> iconDefaultColor = <Color>[
    consumer_light.FhColors.iconDefault,
    consumer_dark.FhColors.iconDefault,
    professional_light.FhColors.iconDefault,
    professional_dark.FhColors.iconDefault,
  ];

  static List<Color> iconDisabledColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];
}
