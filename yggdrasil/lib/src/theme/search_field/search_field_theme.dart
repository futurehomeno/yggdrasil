import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'search_field_theme.tailor.dart';

@tailorComponent
class _$YgSearchFieldTheme {
  // region ProgressIndicator

  static const List<Size> progressIndicatorSize = <Size>[
    Size.square(22.5),
    Size.square(22.5),
    Size.square(22.5),
    Size.square(22.5),
  ];

  static const List<Color> progressIndicatorColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  // endregion

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];

  static const List<Curve> animationCurve = <Curve>[
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
  ];
}
