import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'dialog_theme.tailor.dart';

@tailorComponent
class _$YgDialogTheme {
  static List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static List<Color> iconContainerColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  static List<EdgeInsets> outerPadding = <EdgeInsets>[
    const EdgeInsets.all(consumer_light.FhDimensions.md),
    const EdgeInsets.all(consumer_dark.FhDimensions.md),
    const EdgeInsets.all(professional_light.FhDimensions.md),
    const EdgeInsets.all(professional_dark.FhDimensions.md),
  ];

  static List<EdgeInsets> iconPadding = <EdgeInsets>[
    const EdgeInsets.all(consumer_light.FhDimensions.xs),
    const EdgeInsets.all(consumer_dark.FhDimensions.xs),
    const EdgeInsets.all(professional_light.FhDimensions.xs),
    const EdgeInsets.all(professional_dark.FhDimensions.xs),
  ];

  static List<double> titleDescriptionSpacing = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  static List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.sectionHeading2Medium,
    consumer_dark.FhTextStyles.sectionHeading2Medium,
    professional_light.FhTextStyles.sectionHeading2Medium,
    professional_dark.FhTextStyles.sectionHeading2Medium,
  ];

  static List<TextStyle> descriptionTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Regular,
    consumer_dark.FhTextStyles.paragraph3Regular,
    professional_light.FhTextStyles.paragraph3Regular,
    professional_dark.FhTextStyles.paragraph3Regular,
  ];

  static List<BorderRadius> outerBorderRadius = <BorderRadius>[
    consumer_light.FhRadii.xl,
    consumer_dark.FhRadii.xl,
    professional_light.FhRadii.xl,
    professional_dark.FhRadii.xl,
  ];

  static List<double> buttonSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static List<Color> scrimColor = <Color>[
    consumer_light.FhColors.backgroundOverlay,
    consumer_dark.FhColors.backgroundOverlay,
    professional_light.FhColors.backgroundOverlay,
    professional_dark.FhColors.backgroundOverlay,
  ];

  static List<double> paddingToScreenEdge = <double>[
    consumer_light.FhDimensions.xl,
    consumer_dark.FhDimensions.xl,
    professional_light.FhDimensions.xl,
    professional_dark.FhDimensions.xl,
  ];

  static List<double> minWidth = <double>[
    260,
    260,
    260,
    260,
  ];

  static List<double> maxWidth = <double>[
    480,
    480,
    480,
    480,
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
