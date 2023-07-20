import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'bottom_sheet_theme.tailor.dart';

@tailorComponent
class _$YgBottomSheetTheme {
  static List<Color> handleColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static List<double> handleWidth = <double>[
    48.0,
    48.0,
    48.0,
    48.0,
  ];

  static List<double> handleHeight = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static List<Color> scrimColor = <Color>[
    consumer_light.FhColors.backgroundOverlay,
    consumer_dark.FhColors.backgroundOverlay,
    professional_light.FhColors.backgroundOverlay,
    professional_dark.FhColors.backgroundOverlay,
  ];

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    BorderRadius.only(
      topLeft: Radius.circular(consumer_light.FhDimensions.xl),
      topRight: Radius.circular(consumer_light.FhDimensions.xl),
    ),
    BorderRadius.only(
      topLeft: Radius.circular(consumer_dark.FhDimensions.xl),
      topRight: Radius.circular(consumer_dark.FhDimensions.xl),
    ),
    BorderRadius.only(
      topLeft: Radius.circular(professional_light.FhDimensions.xl),
      topRight: Radius.circular(professional_light.FhDimensions.xl),
    ),
    BorderRadius.only(
      topLeft: Radius.circular(professional_dark.FhDimensions.xl),
      topRight: Radius.circular(professional_dark.FhDimensions.xl),
    ),
  ];

  static const List<EdgeInsets> outerPadding = <EdgeInsets>[
    EdgeInsets.only(
      top: consumer_light.FhDimensions.md,
      bottom: consumer_light.FhDimensions.lg,
    ),
    EdgeInsets.only(
      top: consumer_dark.FhDimensions.md,
      bottom: consumer_dark.FhDimensions.lg,
    ),
    EdgeInsets.only(
      top: professional_light.FhDimensions.md,
      bottom: professional_light.FhDimensions.lg,
    ),
    EdgeInsets.only(
      top: professional_dark.FhDimensions.md,
      bottom: professional_dark.FhDimensions.lg,
    ),
  ];

  static const List<EdgeInsets> headerPadding = <EdgeInsets>[
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.xl,
      0.0,
      consumer_light.FhDimensions.xl,
      consumer_light.FhDimensions.md,
    ),
    EdgeInsets.fromLTRB(
      consumer_dark.FhDimensions.xl,
      0.0,
      consumer_dark.FhDimensions.xl,
      consumer_dark.FhDimensions.md,
    ),
    EdgeInsets.fromLTRB(
      professional_light.FhDimensions.xl,
      0.0,
      professional_light.FhDimensions.xl,
      professional_light.FhDimensions.md,
    ),
    EdgeInsets.fromLTRB(
      professional_dark.FhDimensions.xl,
      0.0,
      professional_dark.FhDimensions.xl,
      professional_dark.FhDimensions.md,
    ),
  ];

  static const List<EdgeInsets> contentPadding = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.xl,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.xl,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.xl,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.xl,
    ),
  ];

  static const List<EdgeInsets> footerPadding = <EdgeInsets>[
    EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.xl,
      0.0,
      consumer_light.FhDimensions.xl,
      0.0,
    ),
    EdgeInsets.fromLTRB(
      consumer_dark.FhDimensions.xl,
      0.0,
      consumer_dark.FhDimensions.xl,
      0.0,
    ),
    EdgeInsets.fromLTRB(
      professional_light.FhDimensions.xl,
      0.0,
      professional_light.FhDimensions.xl,
      0.0,
    ),
    EdgeInsets.fromLTRB(
      professional_dark.FhDimensions.xl,
      0.0,
      professional_dark.FhDimensions.xl,
      0.0,
    ),
  ];

  static List<TextStyle> titleStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading2Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.sectionHeading2Medium.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.sectionHeading2Medium.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.sectionHeading2Medium.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  static List<double> flingVelocity = <double>[
    2000,
    2000,
    2000,
    2000,
  ];

  static List<Duration> movementAnimationDuration = <Duration>[
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
  ];

  static List<Curve> movementAnimationCurve = <Curve>[
    const Cubic(0.42, 0, 0.2, 1),
    const Cubic(0.42, 0, 0.2, 1),
    const Cubic(0.42, 0, 0.2, 1),
    const Cubic(0.42, 0, 0.2, 1),
  ];
}
