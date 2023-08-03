import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'warning_tag_theme.tailor.dart';

@tailorComponent
class _$WarningTagTheme {
  static List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundWarningWeak,
    consumer_dark.FhColors.backgroundWarningWeak,
    professional_light.FhColors.backgroundWarningWeak,
    professional_dark.FhColors.backgroundWarningWeak,
  ];

  static List<Color> strongBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundWarningStrong,
    consumer_dark.FhColors.backgroundWarningStrong,
    professional_light.FhColors.backgroundWarningStrong,
    professional_dark.FhColors.backgroundWarningStrong,
  ];

  static List<Color> disabledBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundTransparent,
    consumer_dark.FhColors.backgroundTransparent,
    professional_light.FhColors.backgroundTransparent,
    professional_dark.FhColors.backgroundTransparent,
  ];
}
