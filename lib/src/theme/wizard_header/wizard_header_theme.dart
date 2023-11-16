import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'wizard_header_theme.tailor.dart';

@tailorComponent
class _$YgWizardHeaderTheme {
  static final List<TextStyle> counterTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    consumer_dark.FhTextStyles.caption1Regular.copyWith(
      color: consumer_dark.FhColors.textWeak,
    ),
    professional_light.FhTextStyles.caption1Regular.copyWith(
      color: professional_light.FhColors.textWeak,
    ),
    professional_dark.FhTextStyles.caption1Regular.copyWith(
      color: professional_dark.FhColors.textWeak,
    ),
  ];

  // region Container

  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<EdgeInsets> padding = <EdgeInsets>[
    EdgeInsets.only(
      left: consumer_light.FhDimensions.md,
      right: consumer_light.FhDimensions.md,
      bottom: consumer_light.FhDimensions.md,
      top: consumer_light.FhDimensions.xs,
    ),
    EdgeInsets.only(
      left: consumer_dark.FhDimensions.md,
      right: consumer_dark.FhDimensions.md,
      bottom: consumer_dark.FhDimensions.md,
      top: consumer_dark.FhDimensions.xs,
    ),
    EdgeInsets.only(
      left: professional_light.FhDimensions.md,
      right: professional_light.FhDimensions.md,
      bottom: professional_light.FhDimensions.md,
      top: professional_light.FhDimensions.xs,
    ),
    EdgeInsets.only(
      left: professional_dark.FhDimensions.md,
      right: professional_dark.FhDimensions.md,
      bottom: professional_dark.FhDimensions.md,
      top: professional_dark.FhDimensions.xs,
    ),
  ];

  // endregion

  // region Title

  // TODO(DEV-2436): Remove height when tokens have been updated.
  static final List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading2Medium.copyWith(height: 24 / 20),
    consumer_dark.FhTextStyles.sectionHeading2Medium.copyWith(height: 24 / 20),
    professional_light.FhTextStyles.sectionHeading2Medium.copyWith(height: 24 / 20),
    professional_dark.FhTextStyles.sectionHeading2Medium.copyWith(height: 24 / 20),
  ];

  static const List<EdgeInsets> titlePadding = <EdgeInsets>[
    EdgeInsets.only(top: consumer_light.FhDimensions.xxs),
    EdgeInsets.only(top: consumer_dark.FhDimensions.xxs),
    EdgeInsets.only(top: professional_light.FhDimensions.xxs),
    EdgeInsets.only(top: professional_dark.FhDimensions.xxs),
  ];

  // endregion

  // region Progress bar

  static const List<Color> barForegroundColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  static const List<Color> barBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static const List<EdgeInsets> barPadding = <EdgeInsets>[
    EdgeInsets.only(right: consumer_light.FhDimensions.xs),
    EdgeInsets.only(right: consumer_dark.FhDimensions.xs),
    EdgeInsets.only(right: professional_light.FhDimensions.xs),
    EdgeInsets.only(right: professional_dark.FhDimensions.xs),
  ];

  static const List<double> barSegmentGap = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<double> barStroke = <double>[
    4.0,
    4.0,
    4.0,
    4.0,
  ];

  // endregion

  // region Animation

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 300),
    Duration(milliseconds: 300),
    Duration(milliseconds: 300),
    Duration(milliseconds: 300),
  ];

  static const List<Curve> animationCurve = <Curve>[
    Cubic(0.42, 0, 0.58, 1),
    Cubic(0.42, 0, 0.58, 1),
    Cubic(0.42, 0, 0.58, 1),
    Cubic(0.42, 0, 0.58, 1),
  ];

  // endregion
}
