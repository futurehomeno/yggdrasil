import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'toggle_text_button_theme.tailor.dart';

@tailorComponent
class _$ToggleTextButtonTheme {
  static const List<EdgeInsets> paddingSmall = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.sm,
      vertical: consumer_light.FhDimensions.xxs,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.sm,
      vertical: consumer_dark.FhDimensions.xxs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.sm,
      vertical: professional_light.FhDimensions.xxs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.sm,
      vertical: professional_dark.FhDimensions.xxs,
    ),
  ];

  static const List<EdgeInsets> paddingMedium = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.md,
      vertical: consumer_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.md,
      vertical: consumer_dark.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.md,
      vertical: professional_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.md,
      vertical: professional_dark.FhDimensions.xs,
    ),
  ];

  static const List<EdgeInsets> paddingLarge = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.lg,
      vertical: consumer_light.FhDimensions.sm,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.lg,
      vertical: consumer_dark.FhDimensions.sm,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.lg,
      vertical: professional_light.FhDimensions.sm,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.lg,
      vertical: professional_dark.FhDimensions.sm,
    ),
  ];
}
