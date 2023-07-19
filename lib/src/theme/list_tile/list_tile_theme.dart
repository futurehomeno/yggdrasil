import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'list_tile_theme.tailor.dart';

@tailorComponent
class _$YgListTileTheme {
  static List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.pageHeading3Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
    ),
    consumer_dark.FhTextStyles.pageHeading3Medium.copyWith(
      color: consumer_dark.FhColors.textDefault,
    ),
    professional_light.FhTextStyles.pageHeading3Medium.copyWith(
      color: professional_light.FhColors.textDefault,
    ),
    professional_dark.FhTextStyles.pageHeading3Medium.copyWith(
      color: professional_dark.FhColors.textDefault,
    ),
  ];

  static List<TextStyle> subtitleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular.copyWith(
      color: consumer_light.FhColors.textWeak,
    ),
    consumer_dark.FhTextStyles.caption1Regular.copyWith(
      color: consumer_dark.FhColors.textWeak,
    ),
    professional_light.FhTextStyles.caption1Regular.copyWith(
      color: professional_light.FhColors.textWeak,
    ),
    professional_dark.FhTextStyles.caption1Regular.copyWith(
      color: professional_dark.FhColors.textWeak,
    ),
  ];

  static List<EdgeInsets> padding = <EdgeInsets>[
    const EdgeInsets.all(
      consumer_light.FhDimensions.sm,
    ),
    const EdgeInsets.all(
      consumer_dark.FhDimensions.sm,
    ),
    const EdgeInsets.all(
      professional_light.FhDimensions.sm,
    ),
    const EdgeInsets.all(
      professional_dark.FhDimensions.sm,
    )
  ];

  static List<double> contentSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static List<double> iconSize = <double>[
    consumer_light.FhDimensions.lg,
    consumer_dark.FhDimensions.lg,
    professional_light.FhDimensions.lg,
    professional_dark.FhDimensions.lg,
  ];

  static List<double> splashRadius = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];
}
