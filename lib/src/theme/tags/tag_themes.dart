import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'tag_themes.tailor.dart';

@tailorComponent
class _$YgTagThemes {
  @themeExtension
  static List<NeutralTagTheme> neutralTagTheme = NeutralTagTheme.themes;

  @themeExtension
  static List<InformativeTagTheme> informativeTagTheme = InformativeTagTheme.themes;

  @themeExtension
  static List<PositiveTagTheme> positiveTagTheme = PositiveTagTheme.themes;

  @themeExtension
  static List<WarningTagTheme> warningTagTheme = WarningTagTheme.themes;

  @themeExtension
  static List<NegativeTagTheme> negativeTagTheme = NegativeTagTheme.themes;

  static List<EdgeInsets> paddingSmall = <EdgeInsets>[
    const EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.xxs,
      horizontal: consumer_light.FhDimensions.md,
    ),
    const EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.xxs,
      horizontal: consumer_dark.FhDimensions.md,
    ),
    const EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.xxs,
      horizontal: professional_light.FhDimensions.md,
    ),
    const EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.xxs,
      horizontal: professional_dark.FhDimensions.md,
    )
  ];

  static List<EdgeInsets> paddingMedium = <EdgeInsets>[
    const EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.xs,
      horizontal: consumer_light.FhDimensions.lg,
    ),
    const EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.xs,
      horizontal: consumer_dark.FhDimensions.lg,
    ),
    const EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.xs,
      horizontal: professional_light.FhDimensions.lg,
    ),
    const EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.xs,
      horizontal: professional_dark.FhDimensions.lg,
    )
  ];

  static List<double> iconSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];

  static List<double> borderWidth = <double>[
    consumer_light.FhBorders.sm.left.width,
    consumer_dark.FhBorders.sm.left.width,
    professional_light.FhBorders.sm.left.width,
    professional_dark.FhBorders.sm.left.width,
  ];
}
