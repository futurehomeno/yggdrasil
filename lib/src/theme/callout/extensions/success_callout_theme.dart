import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'success_callout_theme.tailor.dart';

@tailorComponent
class _$SuccessCalloutTheme {
  static List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundSuccessWeak,
    consumer_dark.FhColors.backgroundSuccessWeak,
    professional_light.FhColors.backgroundSuccessWeak,
    professional_dark.FhColors.backgroundSuccessWeak,
  ];

  static List<Color> borderColor = <Color>[
    consumer_light.FhColors.borderSuccessWeak,
    consumer_dark.FhColors.borderSuccessWeak,
    professional_light.FhColors.borderSuccessWeak,
    professional_dark.FhColors.borderSuccessWeak,
  ];
}
