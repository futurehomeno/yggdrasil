import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'highlight_snack_bar_theme.tailor.dart';

@tailorComponent
class _$HighlightSnackBarTheme {
  static const List<Color> iconContainerColor = <Color>[
    consumer_light.FhColors.backgroundHighlightWeak,
    consumer_dark.FhColors.backgroundHighlightWeak,
    professional_light.FhColors.backgroundHighlightWeak,
    professional_dark.FhColors.backgroundHighlightWeak,
  ];

  static const List<Color> iconColor = <Color>[
    consumer_light.FhColors.iconHighlight,
    consumer_dark.FhColors.iconHighlight,
    professional_light.FhColors.iconHighlight,
    professional_dark.FhColors.iconHighlight,
  ];
}
