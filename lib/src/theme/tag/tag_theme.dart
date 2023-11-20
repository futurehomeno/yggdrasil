import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'tag_theme.tailor.dart';

@tailorComponent
class _$YgTagTheme {
  @themeExtension
  static final List<YgNeutralTagTheme> neutralTagTheme = YgNeutralTagTheme.themes;

  @themeExtension
  static final List<YgInformativeTagTheme> informativeTagTheme = YgInformativeTagTheme.themes;

  @themeExtension
  static final List<YgPositiveTagTheme> positiveTagTheme = YgPositiveTagTheme.themes;

  @themeExtension
  static final List<YgWarningTagTheme> warningTagTheme = YgWarningTagTheme.themes;

  @themeExtension
  static final List<YgNegativeTagTheme> negativeTagTheme = YgNegativeTagTheme.themes;

  static const List<EdgeInsets> paddingSmall = <EdgeInsets>[
    EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 6,
    ),
    EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 6,
    ),
    EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 6,
    ),
    EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 6,
    ),
  ];

  static const List<EdgeInsets> paddingMedium = <EdgeInsets>[
    EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.xxs,
      horizontal: consumer_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.xxs,
      horizontal: consumer_dark.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.xxs,
      horizontal: professional_light.FhDimensions.xs,
    ),
    EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.xxs,
      horizontal: professional_dark.FhDimensions.xs,
    ),
  ];

  static const List<double> iconSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static const List<Color> iconWeakColor = <Color>[
    consumer_light.FhColors.iconDefault,
    consumer_dark.FhColors.iconDefault,
    professional_light.FhColors.iconDefault,
    professional_dark.FhColors.iconDefault,
  ];

  static const List<Color> iconWeakDisabledColor = <Color>[
    consumer_light.FhColors.iconDefault,
    consumer_dark.FhColors.iconDefault,
    professional_light.FhColors.iconDefault,
    professional_dark.FhColors.iconDefault,
  ];

  static const List<Color> iconStrongColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static const List<Color> iconStrongDisabledColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static final List<Color> splashStrongColor = <Color>[
    consumer_light.FhColors.backgroundDefault.withOpacity(0.2),
    consumer_dark.FhColors.backgroundDefault.withOpacity(0.2),
    professional_light.FhColors.backgroundDefault.withOpacity(0.2),
    professional_dark.FhColors.backgroundDefault.withOpacity(0.2),
  ];

  static final List<Color> splashWeakColor = <Color>[
    consumer_light.FhColors.backgroundInverse.withOpacity(0.2),
    consumer_dark.FhColors.backgroundInverse.withOpacity(0.2),
    professional_light.FhColors.backgroundInverse.withOpacity(0.2),
    professional_dark.FhColors.backgroundInverse.withOpacity(0.2),
  ];

  static const List<double> iconSize = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];

  static final List<double> borderWidth = <double>[
    consumer_light.FhBorders.sm.left.width,
    consumer_dark.FhBorders.sm.left.width,
    professional_light.FhBorders.sm.left.width,
    professional_dark.FhBorders.sm.left.width,
  ];

  static final List<TextStyle> textStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.caption1Medium.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.caption1Medium.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.caption1Medium.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  static final List<TextStyle> strongTextStyle = <TextStyle>[
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

  static final List<TextStyle> disabledTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.caption1Medium.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.caption1Medium.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.caption1Medium.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  static final List<TextStyle> disabledStrongTextStyle = <TextStyle>[
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
}
