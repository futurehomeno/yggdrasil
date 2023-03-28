import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart'
    as consumer_light;

import 'extensions/_extensions.dart';

part 'button_themes.tailor.dart';

@tailorComponent
class _$YgButtonThemes {
  @themeExtension
  static List<CriticalButtonTheme> criticalButtonTheme =
      CriticalButtonTheme.themes;

  @themeExtension
  static List<LinkButtonTheme> linkButtonTheme = LinkButtonTheme.themes;

  @themeExtension
  static List<PrimaryButtonTheme> primaryButtonTheme =
      PrimaryButtonTheme.themes;

  @themeExtension
  static List<SecondaryButtonTheme> secondaryButtonTheme =
      SecondaryButtonTheme.themes;

  @themeExtension
  static List<TextButtonTheme> textButtonTheme = TextButtonTheme.themes;

  static List<EdgeInsets> buttonPadding = <EdgeInsets>[
    const EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
    ),
    const EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
    ),
    const EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
    ),
    const EdgeInsets.fromLTRB(
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
      consumer_light.FhDimensions.lg,
      consumer_light.FhDimensions.xs,
    )
  ];
}
