import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'icon_button_theme.tailor.dart';

@tailorComponent
class _$YgIconButtonTheme {
  @themeExtension
  static const List<StandardIconButtonTheme> standardIconButtonTheme = StandardIconButtonTheme.themes;

  @themeExtension
  static const List<FilledIconButtonTheme> filledIconButtonTheme = FilledIconButtonTheme.themes;

  @themeExtension
  static const List<TonalIconButtonTheme> tonalIconButtonTheme = TonalIconButtonTheme.themes;

  @themeExtension
  static const List<OutlinedIconButtonTheme> outlinedIconButtonTheme = OutlinedIconButtonTheme.themes;

  static const List<double> sizeSmall = <double>[
    consumer_light.FhDimensions.xl,
    consumer_dark.FhDimensions.xl,
    professional_light.FhDimensions.xl,
    professional_dark.FhDimensions.xl,
  ];

  static const List<double> sizeMedium = <double>[
    consumer_light.FhDimensions.xxl,
    consumer_dark.FhDimensions.xxl,
    professional_light.FhDimensions.xxl,
    professional_dark.FhDimensions.xxl,
  ];

  static const List<double> iconSizeSmall = <double>[
    consumer_light.FhDimensions.sm,
    consumer_dark.FhDimensions.sm,
    professional_light.FhDimensions.sm,
    professional_dark.FhDimensions.sm,
  ];

  static const List<double> iconSizeMedium = <double>[
    consumer_light.FhDimensions.lg,
    consumer_dark.FhDimensions.lg,
    professional_light.FhDimensions.lg,
    professional_dark.FhDimensions.lg,
  ];
}
