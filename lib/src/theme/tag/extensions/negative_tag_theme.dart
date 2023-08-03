import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'negative_tag_theme.tailor.dart';

@tailorComponent
class _$NegativeTagTheme {
  static List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundCriticalWeak,
    consumer_dark.FhColors.backgroundCriticalWeak,
    professional_light.FhColors.backgroundCriticalWeak,
    professional_dark.FhColors.backgroundCriticalWeak,
  ];

  static List<Color> strongBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundCriticalStrong,
    consumer_dark.FhColors.backgroundCriticalStrong,
    professional_light.FhColors.backgroundCriticalStrong,
    professional_dark.FhColors.backgroundCriticalStrong,
  ];

  static List<Color> disabledBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundTransparent,
    consumer_dark.FhColors.backgroundTransparent,
    professional_light.FhColors.backgroundTransparent,
    professional_dark.FhColors.backgroundTransparent,
  ];
}
