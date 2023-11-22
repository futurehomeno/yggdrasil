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
  static final List<YgSectionHeaderTheme> sectionHeader = YgSectionHeaderTheme.themes;

  static const List<EdgeInsets> padding = <EdgeInsets>[
    EdgeInsets.only(
      left: consumer_light.FhDimensions.md,
      right: consumer_light.FhDimensions.md,
      bottom: consumer_light.FhDimensions.md,
    ),
    EdgeInsets.only(
      left: consumer_dark.FhDimensions.md,
      right: consumer_dark.FhDimensions.md,
      bottom: consumer_dark.FhDimensions.md,
    ),
    EdgeInsets.only(
      left: professional_light.FhDimensions.md,
      right: professional_light.FhDimensions.md,
      bottom: professional_light.FhDimensions.md,
    ),
    EdgeInsets.only(
      left: professional_dark.FhDimensions.md,
      right: professional_dark.FhDimensions.md,
      bottom: professional_dark.FhDimensions.md,
    ),
  ];

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];

  static const List<Curve> animationCurve = <Curve>[
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
  ];
}
