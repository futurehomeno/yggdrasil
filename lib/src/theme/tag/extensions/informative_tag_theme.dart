import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'informative_tag_theme.tailor.dart';

@tailorComponent
class _$InformativeTagTheme {
  static List<Color> backgroundColor = <Color>[
    consumer_light.FhColors.backgroundHighlightWeak,
    consumer_dark.FhColors.backgroundHighlightWeak,
    professional_light.FhColors.backgroundHighlightWeak,
    professional_dark.FhColors.backgroundHighlightWeak,
  ];

  static List<Color> strongBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundHighlightStrong,
    consumer_dark.FhColors.backgroundHighlightStrong,
    professional_light.FhColors.backgroundHighlightStrong,
    professional_dark.FhColors.backgroundHighlightStrong,
  ];

  static List<Color> disabledBackgroundColor = <Color>[
    consumer_light.FhColors.backgroundTransparent,
    consumer_dark.FhColors.backgroundTransparent,
    professional_light.FhColors.backgroundTransparent,
    professional_dark.FhColors.backgroundTransparent,
  ];

  static List<TextStyle> textStyle = <TextStyle>[
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

  static List<TextStyle> strongTextStyle = <TextStyle>[
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

  static List<TextStyle> disabledTextStyle = <TextStyle>[
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
}
