import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'badge_theme.tailor.dart';

@tailorComponent
class _$YgBadgeTheme {
  // region Text

  static final List<TextStyle> weakTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Bold.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.caption1Bold.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.caption1Bold.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.caption1Bold.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  static final List<TextStyle> strongTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Bold.copyWith(
      color: consumer_light.FhColors.textInverse,
    ),
    consumer_dark.FhTextStyles.caption1Bold.copyWith(
      color: consumer_dark.FhColors.textInverse,
    ),
    professional_light.FhTextStyles.caption1Bold.copyWith(
      color: professional_light.FhColors.textInverse,
    ),
    professional_dark.FhTextStyles.caption1Bold.copyWith(
      color: professional_dark.FhColors.textInverse,
    ),
  ];

  static const List<double> textMinWidth = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static const List<EdgeInsets> textPadding = <EdgeInsets>[
    EdgeInsets.symmetric(
      horizontal: consumer_light.FhDimensions.xxs,
      vertical: 2.0,
    ),
    EdgeInsets.symmetric(
      horizontal: consumer_dark.FhDimensions.xxs,
      vertical: 2.0,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_light.FhDimensions.xxs,
      vertical: 2.0,
    ),
    EdgeInsets.symmetric(
      horizontal: professional_dark.FhDimensions.xxs,
      vertical: 2.0,
    ),
  ];

  // endregion

  // region Icon

  static const List<Color> weakIconColor = <Color>[
    consumer_light.FhColors.iconDefault,
    consumer_dark.FhColors.iconDefault,
    professional_light.FhColors.iconDefault,
    professional_dark.FhColors.iconDefault,
  ];

  static const List<Color> strongIconColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static const List<EdgeInsets> iconPadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xxs),
    EdgeInsets.all(consumer_dark.FhDimensions.xxs),
    EdgeInsets.all(professional_light.FhDimensions.xxs),
    EdgeInsets.all(professional_dark.FhDimensions.xxs),
  ];

  static const List<EdgeInsets> iconVariantChildPadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xxs),
    EdgeInsets.all(consumer_dark.FhDimensions.xxs),
    EdgeInsets.all(professional_light.FhDimensions.xxs),
    EdgeInsets.all(professional_dark.FhDimensions.xxs),
  ];

  static const List<double> iconSize = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  // endregion

  static const List<Color> weakColor = <Color>[
    consumer_light.FhColors.backgroundWeak,
    consumer_dark.FhColors.backgroundWeak,
    professional_light.FhColors.backgroundWeak,
    professional_dark.FhColors.backgroundWeak,
  ];

  static const List<Color> strongColor = <Color>[
    consumer_light.FhColors.backgroundHighlightDefault,
    consumer_dark.FhColors.backgroundHighlightDefault,
    professional_light.FhColors.backgroundHighlightDefault,
    professional_dark.FhColors.backgroundHighlightDefault,
  ];

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];
}
