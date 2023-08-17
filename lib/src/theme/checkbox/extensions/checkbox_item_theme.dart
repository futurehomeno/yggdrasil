import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'checkbox_item_theme.tailor.dart';

@tailorComponent
class _$YgCheckboxItemTheme {
  static const List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.paragraph2Regular,
    consumer_dark.FhTextStyles.paragraph2Regular,
    professional_light.FhTextStyles.paragraph2Regular,
    professional_dark.FhTextStyles.paragraph2Regular,
  ];

  static const List<double> checkboxTitleSpacing = <double>[
    consumer_light.FhDimensions.xs,
    consumer_dark.FhDimensions.xs,
    professional_light.FhDimensions.xs,
    professional_dark.FhDimensions.xs,
  ];
}
