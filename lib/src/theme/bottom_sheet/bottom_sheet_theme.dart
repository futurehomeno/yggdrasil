import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'bottom_sheet_theme.tailor.dart';

@tailorComponent
class _$YgBottomSheetTheme {
  static const List<Color> handleColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<double> handleWidth = <double>[
    48.0,
    48.0,
    48.0,
    48.0,
  ];

  static const List<double> handleHeight = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> scrimColor = <Color>[
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

  // Vertical outer padding of thw whole sheet.
  static const List<EdgeInsets> verticalOuterPadding = <EdgeInsets>[
    EdgeInsets.only(top: consumer_light.FhDimensions.md),
    EdgeInsets.only(top: consumer_dark.FhDimensions.md),
    EdgeInsets.only(top: professional_light.FhDimensions.md),
    EdgeInsets.only(top: professional_dark.FhDimensions.md),
  ];

  static const List<EdgeInsets> headerHorizontalPadding = <EdgeInsets>[
    EdgeInsets.symmetric(horizontal: consumer_light.FhDimensions.md),
    EdgeInsets.symmetric(horizontal: consumer_dark.FhDimensions.md),
    EdgeInsets.symmetric(horizontal: professional_light.FhDimensions.md),
    EdgeInsets.symmetric(horizontal: professional_dark.FhDimensions.md),
  ];

  // Spacing between the title and the handle
  static const List<double> handleTitleSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  // Spacing between the content.
  static const List<double> contentSpacing = <double>[
    consumer_light.FhDimensions.md,
    consumer_dark.FhDimensions.md,
    professional_light.FhDimensions.md,
    professional_dark.FhDimensions.md,
  ];

  static const List<EdgeInsets> footerPadding = <EdgeInsets>[
    EdgeInsets.only(
      bottom: consumer_light.FhDimensions.md,
      left: consumer_light.FhDimensions.md,
      right: consumer_light.FhDimensions.md,
    ),
    EdgeInsets.only(
      bottom: consumer_dark.FhDimensions.md,
      left: consumer_dark.FhDimensions.md,
      right: consumer_dark.FhDimensions.md,
    ),
    EdgeInsets.only(
      bottom: professional_light.FhDimensions.md,
      left: professional_light.FhDimensions.md,
      right: professional_light.FhDimensions.md,
    ),
    EdgeInsets.only(
      bottom: professional_dark.FhDimensions.md,
      left: professional_dark.FhDimensions.md,
      right: professional_dark.FhDimensions.md,
    ),
  ];

  static final List<TextStyle> titleStyle = <TextStyle>[
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

  static const List<double> flingVelocity = <double>[
    2000,
    2000,
    2000,
    2000,
  ];

  static const List<Duration> movementAnimationDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];

  static const List<Curve> movementAnimationCurve = <Curve>[
    Cubic(0.42, 0, 0.2, 1),
    Cubic(0.42, 0, 0.2, 1),
    Cubic(0.42, 0, 0.2, 1),
    Cubic(0.42, 0, 0.2, 1),
  ];
}
