import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'small_app_bar_theme.tailor.dart';

@tailorComponent
class _$SmallAppBarTheme {
  static final List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.pageHeading3Medium.copyWith(
      color: consumer_light.FhColors.textDefault,
      height: 1.2,
    ),
    consumer_dark.FhTextStyles.pageHeading3Medium.copyWith(
      color: consumer_dark.FhColors.textDefault,
      height: 1.2,
    ),
    professional_light.FhTextStyles.pageHeading3Medium.copyWith(
      color: professional_light.FhColors.textDefault,
      height: 1.2,
    ),
    professional_dark.FhTextStyles.pageHeading3Medium.copyWith(
      color: professional_dark.FhColors.textDefault,
      height: 1.2,
    ),
  ];
}
