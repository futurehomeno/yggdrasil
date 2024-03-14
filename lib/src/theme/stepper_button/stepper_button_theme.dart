import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'stepper_button_theme.tailor.dart';

@tailorComponent
class _$YgStepperButtonTheme {
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

  static const List<Color> iconColor = <Color>[
    consumer_light.FhColors.iconDefault,
    consumer_dark.FhColors.iconDefault,
    professional_light.FhColors.iconDefault,
    professional_dark.FhColors.iconDefault,
  ];

  static const List<Color> disabledIconColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  static final List<Color> splashColor = <Color>[
    consumer_light.FhColors.backgroundDisabled.withOpacity(0.25),
    consumer_dark.FhColors.backgroundDisabled.withOpacity(0.25),
    professional_light.FhColors.backgroundDisabled.withOpacity(0.25),
    professional_dark.FhColors.backgroundDisabled.withOpacity(0.25),
  ];

  static final List<EdgeInsets> paddingMedium = <EdgeInsets>[
    const EdgeInsets.all(consumer_light.FhDimensions.sm),
    const EdgeInsets.all(consumer_dark.FhDimensions.sm),
    const EdgeInsets.all(professional_light.FhDimensions.sm),
    const EdgeInsets.all(professional_dark.FhDimensions.sm),
  ];

  static final List<EdgeInsets> paddingLarge = <EdgeInsets>[
    const EdgeInsets.all(consumer_light.FhDimensions.md),
    const EdgeInsets.all(consumer_dark.FhDimensions.md),
    const EdgeInsets.all(professional_light.FhDimensions.md),
    const EdgeInsets.all(professional_dark.FhDimensions.md),
  ];

  static const List<double> iconSize = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];

  static const List<double> borderWidth = <double>[
    1.0,
    1.0,
    1.0,
    1.0,
  ];
}
