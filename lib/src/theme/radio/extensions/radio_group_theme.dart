import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'radio_group_theme.tailor.dart';

@tailorComponent
class _$YgRadioGroupTheme {
  static const List<TextStyle> labelTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Medium,
    consumer_dark.FhTextStyles.paragraph2Medium,
    professional_light.FhTextStyles.paragraph2Medium,
    professional_dark.FhTextStyles.paragraph2Medium,
  ];

  static const List<double> labelColumnSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];
}
