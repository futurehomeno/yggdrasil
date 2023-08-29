import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'section_header_theme.tailor.dart';

@tailorComponent
class _$YgSectionHeaderTheme {
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
      vertical: consumer_light.FhDimensions.sm,
      horizontal: consumer_light.FhDimensions.md,
    ),
    EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.sm,
      horizontal: consumer_dark.FhDimensions.md,
    ),
    EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.sm,
      horizontal: professional_light.FhDimensions.md,
    ),
    EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.sm,
      horizontal: professional_dark.FhDimensions.md,
    ),
  ];

  static const List<double> titleSubtitleSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];
}
