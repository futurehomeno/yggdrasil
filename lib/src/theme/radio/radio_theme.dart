import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'radio_theme.tailor.dart';

@tailorComponent
class _$YgRadioTheme {
  static List<double> size = <double>[
    consumer_light.FhDimensions.md,
    consumer_dark.FhDimensions.md,
    professional_light.FhDimensions.md,
    professional_dark.FhDimensions.md,
  ];

  // TODO(bjhandeland): Replace with theme token.
  static List<double> padding = <double>[
    4.0,
    4.0,
    4.0,
    4.0,
  ];

  static List<Color> selectedBackgroundColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  static List<Color> selectedHoveredBackgroundColor = <Color>[
    consumer_light.FhColors.interactiveHighlightHovered,
    consumer_dark.FhColors.interactiveHighlightHovered,
    professional_light.FhColors.interactiveHighlightHovered,
    professional_dark.FhColors.interactiveHighlightHovered,
  ];

  static List<Color> selectedPressedBackgroundColor = <Color>[
    consumer_light.FhColors.interactiveHighlightHovered,
    consumer_dark.FhColors.interactiveHighlightHovered,
    professional_light.FhColors.interactiveHighlightHovered,
    professional_dark.FhColors.interactiveHighlightHovered,
  ];

  static List<Color> selectedDisabledBackgroundColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static List<Color> deselectedBackgroundColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static List<Color> deselectedHoveredBackgroundColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];

  static List<Color> deselectedPressedBackgroundColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];

  static List<Color> deselectedDisabledBackgroundColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static List<Color> selectedHandleColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static List<Color> deselectedHandleColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static List<Color> disabledHandleColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  // TODO(bjhandeland): Replace with theme token.
  static List<double> selectedHandleSize = <double>[
    8.0,
    8.0,
    8.0,
    8.0,
  ];

  // TODO(bjhandeland): Replace with theme token.
  static List<double> deselectedHandleSize = <double>[
    16.0,
    16.0,
    16.0,
    16.0,
  ];

  static List<Color> helperHandleColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  static List<double> disabledDeselectedHelperHandleSize = <double>[
    0.0,
    0.0,
    0.0,
    0.0,
  ];

  static List<double> disabledSelectedHelperHandleSize = <double>[
    8.0,
    8.0,
    8.0,
    8.0,
  ];

  // TODO(bjhandeland): Replace with theme token.
  static List<Duration> animationDuration = <Duration>[
    const Duration(milliseconds: 80),
    const Duration(milliseconds: 80),
    const Duration(milliseconds: 80),
    const Duration(milliseconds: 80),
  ];

  // TODO(bjhandeland): Replace with theme token.
  static List<Curve> animationCurve = <Curve>[
    const Cubic(0.35, 0.0, 0.1, 1.0),
    const Cubic(0.35, 0.0, 0.1, 1.0),
    const Cubic(0.35, 0.0, 0.1, 1.0),
    const Cubic(0.35, 0.0, 0.1, 1.0),
  ];
}
