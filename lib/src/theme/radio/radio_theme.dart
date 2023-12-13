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
  static final List<YgRadioGroupTheme> radioGroupTheme = YgRadioGroupTheme.themes;

  @themeExtension
  static final List<YgRadioItemTheme> radioItemTheme = YgRadioItemTheme.themes;

  static const List<double> size = <double>[
    consumer_light.FhDimensions.md,
    consumer_dark.FhDimensions.md,
    professional_light.FhDimensions.md,
    professional_dark.FhDimensions.md,
  ];

  static const List<double> padding = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  // region Border

  static const List<double> borderDefaultOrDisabledSize = <double>[
    2.0,
    2.0,
    2.0,
    2.0,
  ];

  static const List<double> borderSelectedSize = <double>[
    6.0,
    6.0,
    6.0,
    6.0,
  ];

  static const List<Color> borderDefaultColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<Color> borderFocusHoverColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];

  static const List<Color> borderSelectedColor = <Color>[
    consumer_light.FhColors.interactiveHighlightDefault,
    consumer_dark.FhColors.interactiveHighlightDefault,
    professional_light.FhColors.interactiveHighlightDefault,
    professional_dark.FhColors.interactiveHighlightDefault,
  ];

  static const List<Color> borderSelectedFocusHoverColor = <Color>[
    consumer_light.FhColors.interactiveHighlightHovered,
    consumer_dark.FhColors.interactiveHighlightHovered,
    professional_light.FhColors.interactiveHighlightHovered,
    professional_dark.FhColors.interactiveHighlightHovered,
  ];

  static const List<Color> borderErrorColor = <Color>[
    consumer_light.FhColors.interactiveCriticalDefault,
    consumer_dark.FhColors.interactiveCriticalDefault,
    professional_light.FhColors.interactiveCriticalDefault,
    professional_dark.FhColors.interactiveCriticalDefault,
  ];

  static const List<Color> borderErrorFocusHoverColor = <Color>[
    consumer_light.FhColors.interactiveCriticalHovered,
    consumer_dark.FhColors.interactiveCriticalHovered,
    professional_light.FhColors.interactiveCriticalHovered,
    professional_dark.FhColors.interactiveCriticalHovered,
  ];

  static const List<Color> borderDisabledColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  // endregion

  // region Background

  static const List<Color> backgroundDefaultColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> backgroundDisabledColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  // endregion

  // region disabled center dot

  static const List<Color> centerDotDefaultColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static const List<Color> centerDotDisabledColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  static const List<double> centerDotDefaultSize = <double>[
    0.0,
    0.0,
    0.0,
    0.0,
  ];

  static const List<double> centerDotSelectedSize = <double>[
    8.0,
    8.0,
    8.0,
    8.0,
  ];

  // endregion

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
