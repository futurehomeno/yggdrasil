import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'large_app_bar_theme.tailor.dart';

@tailorComponent
class _$LargeAppBarTheme {
  static final List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.pageHeading1Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.pageHeading1Medium.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.pageHeading1Medium.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.pageHeading1Medium.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  static const List<double> expandedHeight = <double>[
    144.0,
    144.0,
    144.0,
    144.0,
  ];

  static const List<double> expandedTitleScale = <double>[
    1.4,
    1.4,
    1.4,
    1.4,
  ];

  static const List<double> topTitlePadding = <double>[
    consumer_light.FhDimensions.lg,
    consumer_dark.FhDimensions.lg,
    professional_light.FhDimensions.lg,
    professional_dark.FhDimensions.lg,
  ];

  static const List<double> bottomTitlePadding = <double>[
    consumer_light.FhDimensions.xl,
    consumer_dark.FhDimensions.xl,
    professional_light.FhDimensions.xl,
    professional_dark.FhDimensions.xl,
  ];
}
