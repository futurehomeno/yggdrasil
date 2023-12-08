import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/callout/extensions/_extensions.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'callout_theme.tailor.dart';

@tailorComponent
class _$YgCalloutTheme {
  @themeExtension
  static final List<CriticalCalloutTheme> criticalCalloutTheme = CriticalCalloutTheme.themes;

  @themeExtension
  static final List<HighlightCalloutTheme> highlightCalloutTheme = HighlightCalloutTheme.themes;

  @themeExtension
  static final List<SuccessCalloutTheme> successCalloutTheme = SuccessCalloutTheme.themes;

  @themeExtension
  static final List<WarningCalloutTheme> warningCalloutTheme = WarningCalloutTheme.themes;

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.sm,
    consumer_dark.FhRadii.sm,
    professional_light.FhRadii.sm,
    professional_dark.FhRadii.sm,
  ];

  static const List<EdgeInsets> padding = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.md,
      vertical: consumer_light.FhDimensions.sm,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.md,
      vertical: consumer_dark.FhDimensions.sm,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.md,
      vertical: professional_light.FhDimensions.sm,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.md,
      vertical: professional_dark.FhDimensions.sm,
    ),
  ];

  static const List<double> titleSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<double> linkSpacing = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  static const List<double> closeButtonSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading3Bold,
    consumer_dark.FhTextStyles.sectionHeading3Bold,
    professional_light.FhTextStyles.sectionHeading3Bold,
    professional_dark.FhTextStyles.sectionHeading3Bold,
  ];

  static const List<TextStyle> descriptionTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Regular,
    consumer_dark.FhTextStyles.paragraph3Regular,
    professional_light.FhTextStyles.paragraph3Regular,
    professional_dark.FhTextStyles.paragraph3Regular,
  ];

  static const List<Curve> animationCurve = <Curve>[
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
  ];

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];
}
