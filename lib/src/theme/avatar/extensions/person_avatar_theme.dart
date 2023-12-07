import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'person_avatar_theme.tailor.dart';

@tailorComponent
class _$YgPersonAvatarTheme {
  static const List<EdgeInsets> badgePadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xxs),
    EdgeInsets.all(consumer_dark.FhDimensions.xxs),
    EdgeInsets.all(professional_light.FhDimensions.xxs),
    EdgeInsets.all(professional_dark.FhDimensions.xxs),
  ];

  static const List<Color> badgeColor = <Color>[
    consumer_light.FhColors.backgroundHighlightWeak,
    consumer_dark.FhColors.backgroundHighlightWeak,
    professional_light.FhColors.backgroundHighlightWeak,
    professional_dark.FhColors.backgroundHighlightWeak,
  ];

  static const List<Border> badgeBorder = <Border>[
    consumer_light.FhBorders.sm,
    consumer_dark.FhBorders.sm,
    professional_light.FhBorders.sm,
    professional_dark.FhBorders.sm,
  ];

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];
}
