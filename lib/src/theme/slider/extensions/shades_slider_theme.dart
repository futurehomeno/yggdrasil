import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'shades_slider_theme.tailor.dart';

@tailorComponent
class _$YgShadesSliderTheme {
  static const List<Color> trackIncreasingColor = <Color>[
    consumer_light.FhColors.backgroundSuccessStrong,
    consumer_dark.FhColors.backgroundSuccessStrong,
    professional_light.FhColors.backgroundSuccessStrong,
    professional_dark.FhColors.backgroundSuccessStrong,
  ];

  static const List<Color> trackDecreasingColor = <Color>[
    consumer_light.FhColors.backgroundHighlightStrong,
    consumer_dark.FhColors.backgroundHighlightStrong,
    professional_light.FhColors.backgroundHighlightStrong,
    professional_dark.FhColors.backgroundHighlightStrong,
  ];

  static const List<Color> differenceIndicatorIncreasingColor = <Color>[
    consumer_light.FhColors.borderSuccessWeak,
    consumer_dark.FhColors.borderSuccessWeak,
    professional_light.FhColors.borderSuccessWeak,
    professional_dark.FhColors.borderSuccessWeak,
  ];

  static const List<Color> differenceIndicatorDecreasingColor = <Color>[
    consumer_light.FhColors.borderHighlightStrong,
    consumer_dark.FhColors.borderHighlightStrong,
    professional_light.FhColors.borderHighlightStrong,
    professional_dark.FhColors.borderHighlightStrong,
  ];
}
