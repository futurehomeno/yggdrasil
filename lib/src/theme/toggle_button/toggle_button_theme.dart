import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'toggle_button_theme.tailor.dart';

@tailorComponent
class _$YgToggleButtonTheme {
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

  static const List<Color> selectedFillColor = <Color>[
    consumer_light.FhColors.backgroundInverse,
    consumer_dark.FhColors.backgroundInverse,
    professional_light.FhColors.backgroundInverse,
    professional_dark.FhColors.backgroundInverse,
  ];

  static const List<Color> selectedHoveredFillColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  static const List<Color> selectedPressedFillColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  static const List<Color> selectedDisabledFillColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static const List<Color> deselectedFillColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> deselectedHoveredFillColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> deselectedPressedFillColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> deselectedErrorFillColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<Color> deselectedDisabledFillColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static const List<Color> selectedDisabledBorderColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static const List<Color> deselectedBorderColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<Color> deselectedHoveredBorderColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];

  static const List<Color> deselectedPressedBorderColor = <Color>[
    consumer_light.FhColors.borderWeak,
    consumer_dark.FhColors.borderWeak,
    professional_light.FhColors.borderWeak,
    professional_dark.FhColors.borderWeak,
  ];

  static const List<Color> deselectedErrorBorderColor = <Color>[
    consumer_light.FhColors.interactiveCriticalDefault,
    consumer_dark.FhColors.interactiveCriticalDefault,
    professional_light.FhColors.interactiveCriticalDefault,
    professional_dark.FhColors.interactiveCriticalDefault,
  ];

  static const List<Color> deselectedDisabledBorderColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static const List<Color> selectedCheckColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static const List<Color> selectedDisabledCheckColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  // TODO(bjhandeland): Replace with theme token.
  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 120),
    Duration(milliseconds: 120),
    Duration(milliseconds: 120),
    Duration(milliseconds: 120),
  ];

  // TODO(bjhandeland): Replace with theme token.
  static const List<Curve> animationCurve = <Curve>[
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
    Cubic(0.35, 0.0, 0.1, 1.0),
  ];
}
