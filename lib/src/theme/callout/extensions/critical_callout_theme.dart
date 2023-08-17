import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'critical_callout_theme.tailor.dart';

@tailorComponent
class _$CriticalCalloutTheme {
  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundCriticalWeak,
    consumer_dark.FhColors.backgroundCriticalWeak,
    professional_light.FhColors.backgroundCriticalWeak,
    professional_dark.FhColors.backgroundCriticalWeak,
  ];

  static const List<Color> borderColor = <Color>[
    consumer_light.FhColors.borderCriticalWeak,
    consumer_dark.FhColors.borderCriticalWeak,
    professional_light.FhColors.borderCriticalWeak,
    professional_dark.FhColors.borderCriticalWeak,
  ];
}
