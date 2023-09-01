import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'toggle_icon_button_theme.tailor.dart';

@tailorComponent
class _$ToggleIconButtonTheme {
  static const List<EdgeInsets> paddingSmall = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xxs),
    EdgeInsets.all(consumer_dark.FhDimensions.xxs),
    EdgeInsets.all(professional_light.FhDimensions.xxs),
    EdgeInsets.all(professional_dark.FhDimensions.xxs),
  ];

  static const List<EdgeInsets> paddingMedium = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xs),
    EdgeInsets.all(consumer_dark.FhDimensions.xs),
    EdgeInsets.all(professional_light.FhDimensions.xs),
    EdgeInsets.all(professional_dark.FhDimensions.xs),
  ];

  static const List<EdgeInsets> paddingLarge = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xs),
    EdgeInsets.all(consumer_dark.FhDimensions.xs),
    EdgeInsets.all(professional_light.FhDimensions.xs),
    EdgeInsets.all(professional_dark.FhDimensions.xs),
  ];
}
