import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'critical_dialog_theme.tailor.dart';

@tailorComponent
class _$CriticalDialogTheme {
  static const List<Color> iconBackground = <Color>[
    consumer_light.FhColors.backgroundCriticalWeak,
    consumer_dark.FhColors.backgroundCriticalWeak,
    professional_light.FhColors.backgroundCriticalWeak,
    professional_dark.FhColors.backgroundCriticalWeak,
  ];

  static const List<Color> iconColor = <Color>[
    consumer_light.FhColors.iconCritical,
    consumer_dark.FhColors.iconCritical,
    professional_light.FhColors.iconCritical,
    professional_dark.FhColors.iconCritical,
  ];

  static const List<EdgeInsets> iconPadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xs),
    EdgeInsets.all(consumer_dark.FhDimensions.xs),
    EdgeInsets.all(professional_light.FhDimensions.xs),
    EdgeInsets.all(professional_dark.FhDimensions.xs),
  ];
}
