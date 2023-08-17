import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'radio_theme.tailor.dart';

@tailorComponent
class _$YgRadioTheme {
  @themeExtension
  static const List<YgRadioGroupTheme> radioGroupTheme = YgRadioGroupTheme.themes;

  @themeExtension
  static const List<YgRadioItemTheme> radioItemTheme = YgRadioItemTheme.themes;

  static const List<double> size = <double>[
    consumer_light.FhDimensions.md,
    consumer_dark.FhDimensions.md,
    professional_light.FhDimensions.md,
    professional_dark.FhDimensions.md,
  ];

  // TODO(bjhandeland): Replace with theme token.
  static const List<double> padding = <double>[
    2.0,
    2.0,
    2.0,
    2.0,
  ];

  static const List<Color> selectedBackgroundColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  static const List<Color> selectedHoveredBackgroundColor = <Color>[
    consumer_light.FhColors.interactiveHighlightHovered,
    consumer_dark.FhColors.interactiveHighlightHovered,
    professional_light.FhColors.interactiveHighlightHovered,
    professional_dark.FhColors.interactiveHighlightHovered,
  ];

  static const List<Color> selectedPressedBackgroundColor = <Color>[
    consumer_light.FhColors.interactiveHighlightHovered,
    consumer_dark.FhColors.interactiveHighlightHovered,
    professional_light.FhColors.interactiveHighlightHovered,
    professional_dark.FhColors.interactiveHighlightHovered,
  ];

  static const List<Color> selectedDisabledBackgroundColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static const List<Color> deselectedBackgroundColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<Color> deselectedHoveredBackgroundColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];

  static const List<Color> deselectedPressedBackgroundColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];

  static const List<Color> deselectedDisabledBackgroundColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static const List<Color> selectedHandleColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static const List<Color> deselectedHandleColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static const List<Color> disabledHandleColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  // TODO(bjhandeland): Replace with theme token.
  static const List<double> selectedHandleSize = <double>[
    8.0,
    8.0,
    8.0,
    8.0,
  ];

  // TODO(bjhandeland): Replace with theme token.
  static const List<double> deselectedHandleSize = <double>[
    16.0,
    16.0,
    16.0,
    16.0,
  ];

  static const List<Color> helperHandleColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  static const List<double> disabledDeselectedHelperHandleSize = <double>[
    0.0,
    0.0,
    0.0,
    0.0,
  ];

  static const List<double> disabledSelectedHelperHandleSize = <double>[
    8.0,
    8.0,
    8.0,
    8.0,
  ];

  // TODO(bjhandeland): Replace with theme token.
  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 80),
    Duration(milliseconds: 80),
    Duration(milliseconds: 80),
    Duration(milliseconds: 80),
  ];

  // TODO(bjhandeland): Replace with theme token.
  static const List<Curve> animationCurve = <Curve>[
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
  ];
}
