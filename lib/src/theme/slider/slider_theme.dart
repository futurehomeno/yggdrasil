import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'slider_theme.tailor.dart';

@tailorComponent
class _$YgSliderTheme {
  @themeExtension
  static final List<YgTemperatureSliderTheme> temperatureSliderTheme = YgTemperatureSliderTheme.themes;

  @themeExtension
  static final List<YgShadesSliderTheme> shadesSliderTheme = YgShadesSliderTheme.themes;

  // region Track

  static const List<Color> trackDisabledColor = <Color>[
    consumer_light.FhColors.borderDisabled,
    consumer_dark.FhColors.borderDisabled,
    professional_light.FhColors.borderDisabled,
    professional_dark.FhColors.borderDisabled,
  ];

  static const List<Color> trackBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundDisabled,
    consumer_dark.FhColors.backgroundDisabled,
    professional_light.FhColors.backgroundDisabled,
    professional_dark.FhColors.backgroundDisabled,
  ];

  static const List<Radius> trackInnerRadius = <Radius>[
    Radius.circular(consumer_light.FhDimensions.xxs),
    Radius.circular(consumer_dark.FhDimensions.xxs),
    Radius.circular(professional_light.FhDimensions.xxs),
    Radius.circular(professional_dark.FhDimensions.xxs),
  ];

  static const List<Radius> trackOuterRadius = <Radius>[
    Radius.circular(consumer_light.FhDimensions.sm),
    Radius.circular(consumer_dark.FhDimensions.sm),
    Radius.circular(professional_light.FhDimensions.sm),
    Radius.circular(professional_dark.FhDimensions.sm),
  ];

  static const List<double> trackHeight = <double>[
    consumer_light.FhDimensions.xl,
    consumer_dark.FhDimensions.xl,
    professional_light.FhDimensions.xl,
    professional_dark.FhDimensions.xl,
  ];

  // endregion

  // region Difference Indicator

  static const List<Color> differenceIndicatorDisabledColor = <Color>[
    consumer_light.FhColors.borderDefault,
    consumer_dark.FhColors.borderDefault,
    professional_light.FhColors.borderDefault,
    professional_dark.FhColors.borderDefault,
  ];

  static const List<double> differenceIndicatorHeight = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static const List<Radius> differenceIndicatorRadius = <Radius>[
    Radius.circular(consumer_light.FhDimensions.xxs),
    Radius.circular(consumer_dark.FhDimensions.xxs),
    Radius.circular(professional_light.FhDimensions.xxs),
    Radius.circular(professional_dark.FhDimensions.xxs),
  ];

  // endregion

  // region

  static const List<Color> handleDefaultColor = <Color>[
    consumer_light.FhColors.backgroundInverse,
    consumer_dark.FhColors.backgroundInverse,
    professional_light.FhColors.backgroundInverse,
    professional_dark.FhColors.backgroundInverse,
  ];

  static const List<Color> handleDisabledColor = <Color>[
    consumer_light.FhColors.iconDisabled,
    consumer_dark.FhColors.iconDisabled,
    professional_light.FhColors.iconDisabled,
    professional_dark.FhColors.iconDisabled,
  ];

  static const List<Color> handleHoverColor = <Color>[
    consumer_light.FhColors.backgroundInverse,
    consumer_dark.FhColors.backgroundInverse,
    professional_light.FhColors.backgroundInverse,
    professional_dark.FhColors.backgroundInverse,
  ];

  static const List<Color> handleFocusColor = <Color>[
    consumer_light.FhColors.backgroundInverse,
    consumer_dark.FhColors.backgroundInverse,
    professional_light.FhColors.backgroundInverse,
    professional_dark.FhColors.backgroundInverse,
  ];

  static const List<Color> handlePressedColor = <Color>[
    consumer_light.FhColors.backgroundInverse,
    consumer_dark.FhColors.backgroundInverse,
    professional_light.FhColors.backgroundInverse,
    professional_dark.FhColors.backgroundInverse,
  ];

  static const List<EdgeInsets> handlePadding = <EdgeInsets>[
    EdgeInsets.symmetric(horizontal: consumer_light.FhDimensions.xxs),
    EdgeInsets.symmetric(horizontal: consumer_dark.FhDimensions.xxs),
    EdgeInsets.symmetric(horizontal: professional_light.FhDimensions.xxs),
    EdgeInsets.symmetric(horizontal: professional_dark.FhDimensions.xxs),
  ];

  // endregion

  // region Value Indicator

  static const List<Color> valueIndicatorDefaultColor = <Color>[
    consumer_light.FhColors.backgroundInverse,
    consumer_dark.FhColors.backgroundInverse,
    professional_light.FhColors.backgroundInverse,
    professional_dark.FhColors.backgroundInverse,
  ];

  static const List<EdgeInsets> valueIndicatorPadding = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.xs,
      vertical: consumer_light.FhDimensions.xxs,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.xs,
      vertical: consumer_dark.FhDimensions.xxs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.xs,
      vertical: professional_light.FhDimensions.xxs,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.xs,
      vertical: professional_dark.FhDimensions.xxs,
    ),
  ];

  static const List<BorderRadius> valueIndicatorRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];

  static const List<double> valueIndicatorBottomOffset = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static final List<TextStyle> valueIndicatorTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Medium.copyWith(
      color: consumer_light.FhColors.textInverse,
    ),
    consumer_dark.FhTextStyles.caption1Medium.copyWith(
      color: consumer_dark.FhColors.textInverse,
    ),
    professional_light.FhTextStyles.caption1Medium.copyWith(
      color: professional_light.FhColors.textInverse,
    ),
    professional_dark.FhTextStyles.caption1Medium.copyWith(
      color: professional_dark.FhColors.textInverse,
    ),
  ];

  // endregion

  static const List<double> stepperButtonsGap = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];

  static const List<Curve> animationCurve = <Curve>[
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
  ];
}
