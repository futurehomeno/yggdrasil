import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'toggle_icon_text_button_theme.tailor.dart';

@tailorComponent
class _$ToggleIconTextButtonTheme {
  static const List<EdgeInsets> paddingSmall = <EdgeInsets>[
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.xs,
      consumer_dark.FhDimensions.xxs,
      professional_light.FhDimensions.sm,
      professional_dark.FhDimensions.xs,
    ),
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.xs,
      consumer_dark.FhDimensions.xxs,
      professional_light.FhDimensions.sm,
      professional_dark.FhDimensions.xs,
    ),
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.xs,
      consumer_dark.FhDimensions.xxs,
      professional_light.FhDimensions.sm,
      professional_dark.FhDimensions.xs,
    ),
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.xs,
      consumer_dark.FhDimensions.xxs,
      professional_light.FhDimensions.sm,
      professional_dark.FhDimensions.xs,
    ),
  ];

  static const List<EdgeInsets> paddingMedium = <EdgeInsets>[
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.sm,
      consumer_dark.FhDimensions.xs,
      professional_light.FhDimensions.md,
      professional_dark.FhDimensions.xs,
    ),
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.sm,
      consumer_dark.FhDimensions.xs,
      professional_light.FhDimensions.md,
      professional_dark.FhDimensions.xs,
    ),
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.sm,
      consumer_dark.FhDimensions.xs,
      professional_light.FhDimensions.md,
      professional_dark.FhDimensions.xs,
    ),
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.sm,
      consumer_dark.FhDimensions.xs,
      professional_light.FhDimensions.md,
      professional_dark.FhDimensions.xs,
    ),
  ];

  static const List<EdgeInsets> paddingLarge = <EdgeInsets>[
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.md,
      consumer_dark.FhDimensions.sm,
      professional_light.FhDimensions.lg,
      professional_dark.FhDimensions.sm,
    ),
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.md,
      consumer_dark.FhDimensions.sm,
      professional_light.FhDimensions.lg,
      professional_dark.FhDimensions.sm,
    ),
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.md,
      consumer_dark.FhDimensions.sm,
      professional_light.FhDimensions.lg,
      professional_dark.FhDimensions.sm,
    ),
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.md,
      consumer_dark.FhDimensions.sm,
      professional_light.FhDimensions.lg,
      professional_dark.FhDimensions.sm,
    ),
  ];
}
