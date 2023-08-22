import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'section_tile_theme.tailor.dart';

@tailorComponent
class _$YgSectionTileTheme {
  static const List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading2Medium,
    consumer_dark.FhTextStyles.sectionHeading2Medium,
    professional_light.FhTextStyles.sectionHeading2Medium,
    professional_dark.FhTextStyles.sectionHeading2Medium,
  ];

  static final List<TextStyle> subtitleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    consumer_dark.FhTextStyles.paragraph3Regular.copyWith(
      color: consumer_dark.FhColors.textWeak,
    ),
    professional_light.FhTextStyles.paragraph3Regular.copyWith(
      color: professional_light.FhColors.textWeak,
    ),
    professional_dark.FhTextStyles.paragraph3Regular.copyWith(
      color: professional_dark.FhColors.textWeak,
    ),
  ];

  static const List<EdgeInsets> padding = <EdgeInsets>[
    EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.xs,
      horizontal: consumer_light.FhDimensions.sm,
    ),
    EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.xs,
      horizontal: consumer_dark.FhDimensions.sm,
    ),
    EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.xs,
      horizontal: professional_light.FhDimensions.sm,
    ),
    EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.xs,
      horizontal: professional_dark.FhDimensions.sm,
    ),
  ];

  static const List<double> titleSubtitleSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];
}
