import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'card_theme.tailor.dart';

@tailorComponent
class _$YgCardTheme {
  static List<Color> elevatedBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static List<Color> filledBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  static List<Color> outlinedBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static List<Color> outlinedBorderColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.md,
    consumer_dark.FhRadii.md,
    professional_light.FhRadii.md,
    professional_dark.FhRadii.md,
  ];

  static List<double> verticalCardMargin = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];
}
