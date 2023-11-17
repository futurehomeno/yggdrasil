import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'button_theme.tailor.dart';

@tailorComponent
class _$YgButtonTheme {
  @themeExtension
  static final List<YgCriticalButtonTheme> criticalButtonTheme = YgCriticalButtonTheme.themes;

  @themeExtension
  static final List<YgLinkButtonTheme> linkButtonTheme = YgLinkButtonTheme.themes;

  @themeExtension
  static final List<YgPrimaryButtonTheme> primaryButtonTheme = YgPrimaryButtonTheme.themes;

  @themeExtension
  static final List<YgSecondaryButtonTheme> secondaryButtonTheme = YgSecondaryButtonTheme.themes;

  @themeExtension
  static final List<YgTextButtonTheme> textButtonTheme = YgTextButtonTheme.themes;

  static const List<EdgeInsets> paddingSmall = <EdgeInsets>[
    EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.xxs,
      horizontal: consumer_light.FhDimensions.md,
    ),
    EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.xxs,
      horizontal: consumer_dark.FhDimensions.md,
    ),
    EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.xxs,
      horizontal: professional_light.FhDimensions.md,
    ),
    EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.xxs,
      horizontal: professional_dark.FhDimensions.md,
    ),
  ];

  static const List<EdgeInsets> paddingMedium = <EdgeInsets>[
    EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.xs,
      horizontal: consumer_light.FhDimensions.lg,
    ),
    EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.xs,
      horizontal: consumer_dark.FhDimensions.lg,
    ),
    EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.xs,
      horizontal: professional_light.FhDimensions.lg,
    ),
    EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.xs,
      horizontal: professional_dark.FhDimensions.lg,
    ),
  ];

  static const List<EdgeInsets> paddingLarge = <EdgeInsets>[
    EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.sm,
      horizontal: consumer_light.FhDimensions.xl,
    ),
    EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.sm,
      horizontal: consumer_dark.FhDimensions.xl,
    ),
    EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.sm,
      horizontal: professional_light.FhDimensions.xl,
    ),
    EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.sm,
      horizontal: professional_dark.FhDimensions.xl,
    ),
  ];

  static const List<double> iconSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<double> iconSize = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];

  static final List<double> borderWidth = <double>[
    consumer_light.FhBorders.sm.left.width,
    consumer_dark.FhBorders.sm.left.width,
    professional_light.FhBorders.sm.left.width,
    professional_dark.FhBorders.sm.left.width,
  ];
}
