import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'snack_bar_themes.tailor.dart';

@tailorComponent
class _$YgSnackBarTheme {
  @themeExtension
  static const List<CriticalSnackBarTheme> criticalSnackBarTheme = CriticalSnackBarTheme.themes;

  @themeExtension
  static const List<HighlightSnackBarTheme> highlightSnackBarTheme = HighlightSnackBarTheme.themes;

  @themeExtension
  static const List<SuccessSnackBarTheme> successSnackBarTheme = SuccessSnackBarTheme.themes;

  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundInverse,
    consumer_dark.FhColors.backgroundInverse,
    professional_light.FhColors.backgroundInverse,
    professional_dark.FhColors.backgroundInverse,
  ];

  static const List<Color> closeIconColor = <Color>[
    consumer_light.FhColors.iconInverse,
    consumer_dark.FhColors.iconInverse,
    professional_light.FhColors.iconInverse,
    professional_dark.FhColors.iconInverse,
  ];

  static const List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.sm,
    consumer_dark.FhRadii.sm,
    professional_light.FhRadii.sm,
    professional_dark.FhRadii.sm,
  ];

  // These are not from tokens!
  static const List<EdgeInsets> margin = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xl),
    EdgeInsets.all(consumer_dark.FhDimensions.xl),
    EdgeInsets.all(professional_light.FhDimensions.xl),
    EdgeInsets.all(professional_dark.FhDimensions.xl),
  ];

  static const List<EdgeInsets> padding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.sm),
    EdgeInsets.all(consumer_dark.FhDimensions.sm),
    EdgeInsets.all(professional_light.FhDimensions.sm),
    EdgeInsets.all(professional_dark.FhDimensions.sm),
  ];

  static const List<double> messageSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static const List<EdgeInsets> iconContainerPadding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xxs),
    EdgeInsets.all(consumer_dark.FhDimensions.xxs),
    EdgeInsets.all(professional_light.FhDimensions.xxs),
    EdgeInsets.all(professional_dark.FhDimensions.xxs),
  ];

  static final List<TextStyle> messageTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Regular.copyWith(
      color: consumer_light.FhColors.textInverse,
    ),
    consumer_dark.FhTextStyles.paragraph3Regular.copyWith(
      color: consumer_dark.FhColors.textInverse,
    ),
    professional_light.FhTextStyles.paragraph3Regular.copyWith(
      color: professional_light.FhColors.textInverse,
    ),
    professional_dark.FhTextStyles.paragraph3Regular.copyWith(
      color: professional_dark.FhColors.textInverse,
    ),
  ];
}
