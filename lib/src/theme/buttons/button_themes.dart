import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'button_themes.tailor.dart';

@tailorComponent
class _$YgButtonThemes {
  @themeExtension
  static List<PrimaryButtonTheme> primaryButtonTheme = PrimaryButtonTheme.themes;

  @themeExtension
  static List<SecondaryButtonTheme> secondaryButtonTheme = SecondaryButtonTheme.themes;

  @themeExtension
  static List<TextButtonTheme> textButtonTheme = TextButtonTheme.themes;

  static List<EdgeInsets> buttonPadding = <EdgeInsets>[
    const EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
    ),
    const EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
    ),
    const EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
    ),
    const EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
    )
  ];
}

@tailorComponent
class _$PrimaryButtonTheme {
  static List<Color> textColor = <Color>[
    consumer_light.FhColors.textAccent,
    professional_light.FhColors.textAccent,
    consumer_light.FhColors.textAccent,
    consumer_light.FhColors.textAccent,
  ];

  static List<TextStyle> textStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Medium,
    professional_light.FhTextStyles.paragraph2Medium,
    consumer_light.FhTextStyles.paragraph2Medium,
    consumer_light.FhTextStyles.paragraph2Medium,
  ];

  static List<LinearGradient> backgroundGradient = <LinearGradient>[
    consumer_light.FhGradients.actionPrimaryDefault,
    consumer_light.FhGradients.actionPrimaryDefault,
    consumer_light.FhGradients.actionPrimaryDefault,
    consumer_light.FhGradients.actionPrimaryDefault,
  ];
}

@tailorComponent
class _$SecondaryButtonTheme {
  static List<Color> textColor = <Color>[
    consumer_light.FhColors.textDefault,
    professional_light.FhColors.textDefault,
    consumer_light.FhColors.textDefault,
    consumer_light.FhColors.textDefault,
  ];

  static List<TextStyle> textStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Medium,
    professional_light.FhTextStyles.paragraph2Medium,
    consumer_light.FhTextStyles.paragraph2Medium,
    consumer_light.FhTextStyles.paragraph2Medium,
  ];

  static List<LinearGradient> backgroundGradient = <LinearGradient>[
    consumer_light.FhGradients.actionSecondaryDefault,
    consumer_light.FhGradients.actionSecondaryDefault,
    consumer_light.FhGradients.actionSecondaryDefault,
    consumer_light.FhGradients.actionSecondaryDefault,
  ];
}

@tailorComponent
class _$TextButtonTheme {
  static List<Color> textColor = <Color>[
    consumer_light.FhColors.textSuccess,
    professional_light.FhColors.textSuccess,
    consumer_light.FhColors.textSuccess,
    consumer_light.FhColors.textSuccess,
  ];

  static List<TextStyle> textStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Medium,
    professional_light.FhTextStyles.paragraph2Medium,
    consumer_light.FhTextStyles.paragraph2Medium,
    consumer_light.FhTextStyles.paragraph2Medium,
  ];

  static List<LinearGradient> backgroundGradient = <LinearGradient>[
    consumer_light.FhGradients.actionSecondaryDefault,
    consumer_light.FhGradients.actionSecondaryDefault,
    consumer_light.FhGradients.actionSecondaryDefault,
    consumer_light.FhGradients.actionSecondaryDefault,
  ];
}
