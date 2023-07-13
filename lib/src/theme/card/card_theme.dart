import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'card_theme.tailor.dart';

@tailorComponent
class _$YgCardTheme {
  @themeExtension
  static List<ElevatedCardTheme> elevatedCardTheme = ElevatedCardTheme.themes;

  @themeExtension
  static List<OutlinedCardTheme> outlinedCardTheme = OutlinedCardTheme.themes;

  @themeExtension
  static List<FilledCardTheme> filledCardTheme = FilledCardTheme.themes;

  static List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.md,
    consumer_dark.FhRadii.md,
    professional_light.FhRadii.md,
    professional_dark.FhRadii.md,
  ];

  // TODO(bjhandeland): Use elevation token when available.
  static List<double> elevation = <double>[
    1.0,
    1.0,
    1.0,
    1.0,
  ];
}
