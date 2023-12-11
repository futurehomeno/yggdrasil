import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'section_header_theme.tailor.dart';

@tailorComponent
class _$YgSectionHeaderTheme {
  // TODO(tim): Remove height when tokens are updated.
  static final List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading2Medium.copyWith(
      height: 1.2,
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.sectionHeading2Medium.copyWith(
      height: 1.2,
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.sectionHeading2Medium.copyWith(
      height: 1.2,
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.sectionHeading2Medium.copyWith(
      height: 1.2,
      color: professional_dark.FhColors.textDefault,
    ),
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

  static const List<EdgeInsets> iconPadding = <EdgeInsets>[
    EdgeInsets.only(
      right: consumer_light.FhDimensions.xs,
    ),
    EdgeInsets.only(
      right: consumer_dark.FhDimensions.xs,
    ),
    EdgeInsets.only(
      right: professional_light.FhDimensions.xs,
    ),
    EdgeInsets.only(
      right: professional_dark.FhDimensions.xs,
    ),
  ];

  static const List<EdgeInsets> subtitlePadding = <EdgeInsets>[
    EdgeInsets.only(
      top: consumer_light.FhDimensions.xxs,
    ),
    EdgeInsets.only(
      top: consumer_dark.FhDimensions.xxs,
    ),
    EdgeInsets.only(
      top: professional_light.FhDimensions.xxs,
    ),
    EdgeInsets.only(
      top: professional_dark.FhDimensions.xxs,
    ),
  ];

  static const List<double> trailingSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static const List<double> minAvailableTagWidth = <double>[
    80,
    80,
    80,
    80,
  ];
}
