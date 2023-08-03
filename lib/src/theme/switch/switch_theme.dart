import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'switch_theme.tailor.dart';

@tailorComponent
class _$YgSwitchTheme {
  static List<double> height = <double>[
    consumer_light.FhDimensions.xl,
    consumer_dark.FhDimensions.xl,
    professional_light.FhDimensions.xl,
    professional_dark.FhDimensions.xl,
  ];

  static List<double> width = <double>[
    consumer_light.FhDimensions.xxl,
    consumer_dark.FhDimensions.xxl,
    professional_light.FhDimensions.xxl,
    professional_dark.FhDimensions.xxl,
  ];

  static List<double> handleSize = <double>[
    consumer_light.FhDimensions.md,
    consumer_dark.FhDimensions.md,
    professional_light.FhDimensions.md,
    professional_dark.FhDimensions.md,
  ];

  static List<Color> backgroundSelectedColor = <Color>[
    consumer_light.FhColors.backgroundHighlightDefault,
    consumer_dark.FhColors.backgroundHighlightDefault,
    professional_light.FhColors.backgroundHighlightDefault,
    professional_dark.FhColors.backgroundHighlightDefault,
  ];

  static List<Color> backgroundDeselectedColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static List<Color> backgroundNullColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static List<Color> backgroundDisabledColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static List<Color> handleSelectedColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static List<Color> handleDeselectedColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static List<Color> handleNullColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static List<Color> handleDisabledColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  static List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];

  static List<EdgeInsets> trackPadding = <EdgeInsets>[
    const EdgeInsets.symmetric(horizontal: consumer_light.FhDimensions.xxs),
    const EdgeInsets.symmetric(horizontal: consumer_dark.FhDimensions.xxs),
    const EdgeInsets.symmetric(horizontal: professional_light.FhDimensions.xxs),
    const EdgeInsets.symmetric(horizontal: professional_dark.FhDimensions.xxs),
  ];

  // TODO(bjhandeland): Replace with theme token.
  static List<Duration> animationDuration = <Duration>[
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
    const Duration(milliseconds: 200),
  ];

  // TODO(bjhandeland): Replace with theme token.
  static List<Curve> animationCurve = <Curve>[
    const Cubic(0.42, 0.0, 0.58, 1.0),
    const Cubic(0.42, 0.0, 0.58, 1.0),
    const Cubic(0.42, 0.0, 0.58, 1.0),
    const Cubic(0.42, 0.0, 0.58, 1.0),
  ];
}
