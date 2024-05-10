import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'success_dialog_theme.tailor.dart';

@tailorComponent
class _$SuccessDialogTheme {
  static const List<Color> iconBackground = <Color>[
    consumer_light.FhColors.backgroundSuccessWeak,
    consumer_dark.FhColors.backgroundSuccessWeak,
    professional_light.FhColors.backgroundSuccessWeak,
    professional_dark.FhColors.backgroundSuccessWeak,
  ];

  static const List<Color> iconColor = <Color>[
    consumer_light.FhColors.iconSuccess,
    consumer_dark.FhColors.iconSuccess,
    professional_light.FhColors.iconSuccess,
    professional_dark.FhColors.iconSuccess,
  ];

  static const List<EdgeInsets> iconPadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xs),
    EdgeInsets.all(consumer_dark.FhDimensions.xs),
    EdgeInsets.all(professional_light.FhDimensions.xs),
    EdgeInsets.all(professional_dark.FhDimensions.xs),
  ];
}
