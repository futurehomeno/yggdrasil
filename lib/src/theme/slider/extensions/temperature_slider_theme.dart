import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'temperature_slider_theme.tailor.dart';

@tailorComponent
class _$YgTemperatureSliderTheme {
  static const List<Color> trackIncreasingColor = <Color>[
    consumer_light.FhColors.backgroundWarningDefault,
    consumer_dark.FhColors.backgroundWarningDefault,
    professional_light.FhColors.backgroundWarningDefault,
    professional_dark.FhColors.backgroundWarningDefault,
  ];

  static const List<Color> trackDecreasingColor = <Color>[
    consumer_light.FhColors.backgroundHighlightDefault,
    consumer_dark.FhColors.backgroundHighlightDefault,
    professional_light.FhColors.backgroundHighlightDefault,
    professional_dark.FhColors.backgroundHighlightDefault,
  ];

  static const List<Color> differenceIndicatorIncreasingColor = <Color>[
    consumer_light.FhColors.borderWarningWeak,
    consumer_dark.FhColors.borderWarningWeak,
    professional_light.FhColors.borderWarningWeak,
    professional_dark.FhColors.borderWarningWeak,
  ];

  static const List<Color> differenceIndicatorDecreasingColor = <Color>[
    consumer_light.FhColors.borderHighlightWeak,
    consumer_dark.FhColors.borderHighlightWeak,
    professional_light.FhColors.borderHighlightWeak,
    professional_dark.FhColors.borderHighlightWeak,
  ];
}
