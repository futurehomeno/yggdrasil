import 'package:flutter/material.dart' hide TextButtonTheme;
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'button_themes.tailor.dart';

@tailorComponent
class _$YgButtonThemes {
  @themeExtension
  static List<CriticalButtonTheme> criticalButtonTheme = CriticalButtonTheme.themes;

  @themeExtension
  static List<LinkButtonTheme> linkButtonTheme = LinkButtonTheme.themes;

  @themeExtension
  static List<PrimaryButtonTheme> primaryButtonTheme = PrimaryButtonTheme.themes;

  @themeExtension
  static List<SecondaryButtonTheme> secondaryButtonTheme = SecondaryButtonTheme.themes;

  @themeExtension
  static List<TextButtonTheme> textButtonTheme = TextButtonTheme.themes;

  static List<EdgeInsets> paddingSmall = <EdgeInsets>[
    const EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.xxs,
      horizontal: consumer_light.FhDimensions.md,
    ),
    const EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.xxs,
      horizontal: consumer_dark.FhDimensions.md,
    ),
    const EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.xxs,
      horizontal: professional_light.FhDimensions.md,
    ),
    const EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.xxs,
      horizontal: professional_dark.FhDimensions.md,
    )
  ];

  static List<EdgeInsets> paddingMedium = <EdgeInsets>[
    const EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.xs,
      horizontal: consumer_light.FhDimensions.lg,
    ),
    const EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.xs,
      horizontal: consumer_dark.FhDimensions.lg,
    ),
    const EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.xs,
      horizontal: professional_light.FhDimensions.lg,
    ),
    const EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.xs,
      horizontal: professional_dark.FhDimensions.lg,
    )
  ];

  static List<EdgeInsets> paddingLarge = <EdgeInsets>[
    const EdgeInsets.symmetric(
      vertical: consumer_light.FhDimensions.sm,
      horizontal: consumer_light.FhDimensions.xl,
    ),
    const EdgeInsets.symmetric(
      vertical: consumer_dark.FhDimensions.sm,
      horizontal: consumer_dark.FhDimensions.xl,
    ),
    const EdgeInsets.symmetric(
      vertical: professional_light.FhDimensions.sm,
      horizontal: professional_light.FhDimensions.xl,
    ),
    const EdgeInsets.symmetric(
      vertical: professional_dark.FhDimensions.sm,
      horizontal: professional_dark.FhDimensions.xl,
    )
  ];

  static List<double> iconSpacing = <double>[
    consumer_light.FhDimensions.xxs,
    consumer_dark.FhDimensions.xxs,
    professional_light.FhDimensions.xxs,
    professional_dark.FhDimensions.xxs,
  ];

  static List<BorderRadius> borderRadius = <BorderRadius>[
    consumer_light.FhRadii.xxl,
    consumer_dark.FhRadii.xxl,
    professional_light.FhRadii.xxl,
    professional_dark.FhRadii.xxl,
  ];

  static List<double> borderWidth = <double>[
    consumer_light.FhBorders.sm.left.width,
    consumer_dark.FhBorders.sm.left.width,
    professional_light.FhBorders.sm.left.width,
    professional_dark.FhBorders.sm.left.width,
  ];

  static List<EdgeInsets> somePadding = ThemePadding.only(
    bottom: FhDimensions.sm,
    right: FhDimensions.sm,
  );
}

class ThemePadding {
  const ThemePadding._();

  static List<EdgeInsets> only({
    List<double>? left,
    List<double>? right,
    List<double>? top,
    List<double>? bottom,
  }) {
    final List<EdgeInsets> result = <EdgeInsets>[];
    for (int i = 0; i < 4; i++) {
      result.add(EdgeInsets.only(
        bottom: bottom?[i] ?? 0,
        top: top?[i] ?? 0,
        left: left?[i] ?? 0,
        right: right?[i] ?? 0,
      ));
    }
    return result;
  }

  static List<EdgeInsets> symmetric({
    List<double>? horizontal,
    List<double>? vertical,
  }) {
    return only(
      left: horizontal,
      right: horizontal,
      top: vertical,
      bottom: vertical,
    );
  }

  static List<EdgeInsets> fromLTRB(
    List<double>? left,
    List<double>? top,
    List<double>? right,
    List<double>? bottom,
  ) {
    return only(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }

  static List<EdgeInsets> all(
    List<double>? all,
  ) {
    return only(
      top: all,
      bottom: all,
      left: all,
      right: all,
    );
  }
}

class FhDimensions {
  const FhDimensions._();
  static const List<double> none = <double>[0.0, 0.0, 0.0, 0.0];

  static const List<double> xxs = <double>[5.0, 5.0, 5.0, 5.0];

  static const List<double> xs = <double>[10.0, 10.0, 10.0, 10.0];

  static const List<double> sm = <double>[15.0, 15.0, 15.0, 15.0];

  static const List<double> md = <double>[20.0, 20.0, 20.0, 20.0];

  static const List<double> lg = <double>[25.0, 25.0, 25.0, 25.0];

  static const List<double> xl = <double>[30.0, 30.0, 30.0, 30.0];

  static const List<double> xxl = <double>[50.0, 50.0, 50.0, 50.0];
}
