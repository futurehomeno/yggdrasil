import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'warning_callout_theme.tailor.dart';

@tailorComponent
class _$WarningCalloutTheme {
  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundWarningWeak,
    consumer_dark.FhColors.backgroundWarningWeak,
    professional_light.FhColors.backgroundWarningWeak,
    professional_dark.FhColors.backgroundWarningWeak,
  ];

  static const List<Color> borderColor = <Color>[
    consumer_light.FhColors.borderWarningWeak,
    consumer_dark.FhColors.borderWarningWeak,
    professional_light.FhColors.borderWarningWeak,
    professional_dark.FhColors.borderWarningWeak,
  ];
}
