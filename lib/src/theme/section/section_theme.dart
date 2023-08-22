import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'section_theme.tailor.dart';

@tailorComponent
class _$YgSectionTheme {
  @themeExtension
  static final List<YgSectionTileTheme> sectionTileTheme = YgSectionTileTheme.themes;

  static const List<EdgeInsets> padding = <EdgeInsets>[
    EdgeInsets.only(
      left: consumer_light.FhDimensions.sm,
      right: consumer_light.FhDimensions.sm,
      bottom: consumer_light.FhDimensions.md,
    ),
    EdgeInsets.only(
      left: consumer_dark.FhDimensions.sm,
      right: consumer_dark.FhDimensions.sm,
      bottom: consumer_dark.FhDimensions.md,
    ),
    EdgeInsets.only(
      left: professional_light.FhDimensions.sm,
      right: professional_light.FhDimensions.sm,
      bottom: professional_light.FhDimensions.md,
    ),
    EdgeInsets.only(
      left: professional_dark.FhDimensions.sm,
      right: professional_dark.FhDimensions.sm,
      bottom: professional_dark.FhDimensions.md,
    ),
  ];
}
