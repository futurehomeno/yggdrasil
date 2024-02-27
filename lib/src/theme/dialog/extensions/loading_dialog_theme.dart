import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'loading_dialog_theme.tailor.dart';

@tailorComponent
class _$LoadingDialogTheme {
  static const List<Color> iconBackground = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  static const List<Color> iconColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  static const List<double> circularProgressIndicatorWidth = <double>[
    4,
    4,
    4,
    4,
  ];

  static const List<EdgeInsets> iconPadding = <EdgeInsets>[
    EdgeInsets.all(11),
    EdgeInsets.all(11),
    EdgeInsets.all(11),
    EdgeInsets.all(11),
  ];
}
