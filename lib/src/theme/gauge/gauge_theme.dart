import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'gauge_theme.tailor.dart';

@tailorComponent
class _$YgGaugeTheme {
  static const List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.pageHeading1Medium,
    consumer_dark.FhTextStyles.pageHeading1Medium,
    professional_light.FhTextStyles.pageHeading1Medium,
    professional_dark.FhTextStyles.pageHeading1Medium,
  ];

  static const List<TextStyle> labelTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph3Medium,
    consumer_dark.FhTextStyles.paragraph3Medium,
    professional_light.FhTextStyles.paragraph3Medium,
    professional_dark.FhTextStyles.paragraph3Medium,
  ];

  static final List<TextStyle> notationTextStyle = <TextStyle>[
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

  static const List<Curve> tweenCurve = <Curve>[
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
    Curves.easeInOut,
  ];

  static const List<Duration> tweenDuration = <Duration>[
    Duration(milliseconds: 600),
    Duration(milliseconds: 600),
    Duration(milliseconds: 600),
    Duration(milliseconds: 600),
  ];
}
