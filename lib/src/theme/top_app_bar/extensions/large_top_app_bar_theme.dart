import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/tokens/consumer_dark/_consumer_dark.dart' as consumer_dark;
import 'package:yggdrasil/src/tokens/consumer_light/_consumer_light.dart' as consumer_light;
import 'package:yggdrasil/src/tokens/professional_dark/_professional_dark.dart' as professional_dark;
import 'package:yggdrasil/src/tokens/professional_light/_professional_light.dart' as professional_light;

part 'large_top_app_bar_theme.tailor.dart';

@tailorComponent
class _$LargeTopAppBarTheme {
  static const List<TextStyle> titleTextStyle = <TextStyle>[
    consumer_light.FhTextStyles.pageHeading1Medium,
    consumer_dark.FhTextStyles.pageHeading1Medium,
    professional_light.FhTextStyles.pageHeading1Medium,
    professional_dark.FhTextStyles.pageHeading1Medium,
  ];
}
