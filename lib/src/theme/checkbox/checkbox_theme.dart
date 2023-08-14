import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'checkbox_theme.tailor.dart';

@tailorComponent
class _$YgCheckboxTheme {
  static List<double> size = <double>[
    consumer_light.FhDimensions.md,
    consumer_dark.FhDimensions.md,
    professional_light.FhDimensions.md,
    professional_dark.FhDimensions.md,
  ];

  static List<double> padding = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static List<Color> selectedFillColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  static List<Color> selectedHoveredFillColor = <Color>[
    consumer_light.FhColors.interactiveHighlightHovered,
    consumer_dark.FhColors.interactiveHighlightHovered,
    professional_light.FhColors.interactiveHighlightHovered,
    professional_dark.FhColors.interactiveHighlightHovered,
  ];

  static List<Color> selectedPressedFillColor = <Color>[
    consumer_light.FhColors.interactiveHighlightHovered,
    consumer_dark.FhColors.interactiveHighlightHovered,
    professional_light.FhColors.interactiveHighlightHovered,
    professional_dark.FhColors.interactiveHighlightHovered,
  ];

  static List<Color> selectedErrorFillColor = <Color>[
    consumer_light.FhColors.interactiveCriticalDefault,
    consumer_dark.FhColors.interactiveCriticalDefault,
    professional_light.FhColors.interactiveCriticalDefault,
    professional_dark.FhColors.interactiveCriticalDefault,
  ];

  static List<Color> selectedDisabledFillColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static List<Color> deselectedFillColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static List<Color> deselectedHoveredFillColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static List<Color> deselectedPressedFillColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static List<Color> deselectedErrorFillColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static List<Color> deselectedDisabledFillColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static List<Color> selectedDisabledBorderColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static List<Color> deselectedBorderColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static List<Color> deselectedHoveredBorderColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];

  static List<Color> deselectedPressedBorderColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];

  static List<Color> deselectedErrorBorderColor = <Color>[
    consumer_light.FhColors.interactiveCriticalDefault,
    consumer_dark.FhColors.interactiveCriticalDefault,
    professional_light.FhColors.interactiveCriticalDefault,
    professional_dark.FhColors.interactiveCriticalDefault,
  ];

  static List<Color> deselectedDisabledBorderColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static List<Color> selectedCheckColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static List<Color> selectedDisabledCheckColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  static List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular,
    consumer_dark.FhTextStyles.paragraph2Regular,
    professional_light.FhTextStyles.paragraph2Regular,
    professional_dark.FhTextStyles.paragraph2Regular,
  ];

  static List<TextStyle> descriptionTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular,
    consumer_dark.FhTextStyles.caption1Regular,
    professional_light.FhTextStyles.caption1Regular,
    professional_dark.FhTextStyles.caption1Regular,
  ];

  static List<double> checkboxItemCheckboxTitleSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static List<TextStyle> labelTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Medium,
    consumer_dark.FhTextStyles.paragraph2Medium,
    professional_light.FhTextStyles.paragraph2Medium,
    professional_dark.FhTextStyles.paragraph2Medium,
  ];

  static List<double> checkboxGroupLabelColumnSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  // TODO(bjhandeland): Replace with theme token.
  static List<Duration> animationDuration = <Duration>[
    const Duration(milliseconds: 120),
    const Duration(milliseconds: 120),
    const Duration(milliseconds: 120),
    const Duration(milliseconds: 120),
  ];

  // TODO(bjhandeland): Replace with theme token.
  static List<Curve> animationCurve = <Curve>[
    const Cubic(0.35, 0.0, 0.1, 1.0),
    const Cubic(0.35, 0.0, 0.1, 1.0),
    const Cubic(0.35, 0.0, 0.1, 1.0),
    const Cubic(0.35, 0.0, 0.1, 1.0),
  ];
}
