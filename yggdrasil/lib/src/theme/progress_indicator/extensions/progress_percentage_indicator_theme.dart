import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'progress_percentage_indicator_theme.tailor.dart';

@tailorComponent
class _$ProgressPercentageIndicatorTheme {
  static final List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Regular.copyWith(color: consumer_light.FhColors.textWeak),
    consumer_dark.FhTextStyles.paragraph3Regular.copyWith(color: consumer_dark.FhColors.textWeak),
    professional_light.FhTextStyles.paragraph3Regular.copyWith(color: professional_light.FhColors.textWeak),
    professional_dark.FhTextStyles.paragraph3Regular.copyWith(color: professional_dark.FhColors.textWeak),
  ];

  static final List<TextStyle> percentageTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.display3Bold.copyWith(color: consumer_light.FhColors.textDefault),
    consumer_dark.FhTextStyles.display3Bold.copyWith(color: consumer_dark.FhColors.textDefault),
    professional_light.FhTextStyles.display3Bold.copyWith(color: professional_light.FhColors.textDefault),
    professional_dark.FhTextStyles.display3Bold.copyWith(color: professional_dark.FhColors.textDefault),
  ];

  static final List<TextStyle> timeRemainingTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Bold.copyWith(color: consumer_light.FhColors.textDefault),
    consumer_dark.FhTextStyles.paragraph2Bold.copyWith(color: consumer_dark.FhColors.textDefault),
    professional_light.FhTextStyles.paragraph2Bold.copyWith(color: professional_light.FhColors.textDefault),
    professional_dark.FhTextStyles.paragraph2Bold.copyWith(color: professional_dark.FhColors.textDefault),
  ];

  static final List<TextStyle> remainingSubtitleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Regular.copyWith(color: consumer_light.FhColors.textWeak),
    consumer_dark.FhTextStyles.caption1Regular.copyWith(color: consumer_dark.FhColors.textWeak),
    professional_light.FhTextStyles.caption1Regular.copyWith(color: professional_light.FhColors.textWeak),
    professional_dark.FhTextStyles.caption1Regular.copyWith(color: professional_dark.FhColors.textWeak),
  ];

  static final List<TextStyle> subtitleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.caption1Medium.copyWith(color: consumer_light.FhColors.textWeak),
    consumer_dark.FhTextStyles.caption1Medium.copyWith(color: consumer_dark.FhColors.textWeak),
    professional_light.FhTextStyles.caption1Medium.copyWith(color: professional_light.FhColors.textWeak),
    professional_dark.FhTextStyles.caption1Medium.copyWith(color: professional_dark.FhColors.textWeak),
  ];

  static const List<Color> shimmerColor = <Color>[
    Color(0x40ffffff),
    Color(0x40ffffff),
    Color(0x40ffffff),
    Color(0x40ffffff),
  ];

  static const List<double> contentSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];

  static const List<double> progressBarHeight = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];
}
