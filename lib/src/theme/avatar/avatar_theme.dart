import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

import 'extensions/_extensions.dart';

part 'avatar_theme.tailor.dart';

@tailorComponent
class _$YgAvatarTheme {
  @themeExtension
  static final List<YgPersonAvatarTheme> personAvatarTheme = YgPersonAvatarTheme.themes;

  @themeExtension
  static final List<YgCompanyAvatarTheme> companyAvatarTheme = YgCompanyAvatarTheme.themes;

  static const List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundInverse,
    consumer_dark.FhColors.backgroundInverse,
    professional_light.FhColors.backgroundInverse,
    professional_dark.FhColors.backgroundInverse,
  ];

  static const List<Color> imageBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundDefault,
    consumer_dark.FhColors.backgroundDefault,
    professional_light.FhColors.backgroundDefault,
    professional_dark.FhColors.backgroundDefault,
  ];

  static const List<EdgeInsets> padding = <EdgeInsets>[
    EdgeInsets.all(consumer_light.FhDimensions.xxs),
    EdgeInsets.all(consumer_dark.FhDimensions.xxs),
    EdgeInsets.all(professional_light.FhDimensions.xxs),
    EdgeInsets.all(professional_dark.FhDimensions.xxs),
  ];

  static final List<TextStyle> initialsTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.pageHeading3Medium.copyWith(
      color: consumer_light.FhColors.textInverse,
    ),
    consumer_dark.FhTextStyles.pageHeading3Medium.copyWith(
      color: consumer_dark.FhColors.textInverse,
    ),
    professional_light.FhTextStyles.pageHeading3Medium.copyWith(
      color: professional_light.FhColors.textInverse,
    ),
    professional_dark.FhTextStyles.pageHeading3Medium.copyWith(
      color: professional_dark.FhColors.textInverse,
    ),
  ];

  // This is different from what is in the design because of an edge bleeding
  // issue. Instead of having the border at the side of the avatar it has to
  // extend beyond the avatar and be clipped to size in order to render correctly.
  static const List<BorderSide> borderSide = <BorderSide>[
    BorderSide(
      color: consumer_light.FhColors.borderDefault,
      strokeAlign: BorderSide.strokeAlignCenter,
      width: 2,
    ),
    BorderSide(
      color: consumer_dark.FhColors.borderDefault,
      strokeAlign: BorderSide.strokeAlignCenter,
      width: 2,
    ),
    BorderSide(
      color: professional_light.FhColors.borderDefault,
      strokeAlign: BorderSide.strokeAlignCenter,
      width: 2,
    ),
    BorderSide(
      color: professional_dark.FhColors.borderDefault,
      strokeAlign: BorderSide.strokeAlignCenter,
      width: 2,
    ),
  ];

  static const List<double> diameterLarge = <double>[
    60,
    60,
    60,
    60,
  ];

  static const List<double> diameterMedium = <double>[
    50,
    50,
    50,
    50,
  ];

  static const List<double> diameterSmall = <double>[
    40,
    40,
    40,
    40,
  ];

  static const List<Duration> animationDuration = <Duration>[
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
    Duration(milliseconds: 200),
  ];

  static const List<Curve> animationCurve = <Curve>[
    Cubic(0.42, 0, 0.2, 1),
    Cubic(0.42, 0, 0.2, 1),
    Cubic(0.42, 0, 0.2, 1),
    Cubic(0.42, 0, 0.2, 1),
  ];
}
