import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/progress_indicator/extensions/_extensions.dart';

part 'progress_indicator_theme.tailor.dart';

@tailorComponent
class _$YgProgressIndicatorTheme {
  @themeExtension
  static const List<CircularProgressIndicatorTheme> circularProgressIndicatorTheme =
      CircularProgressIndicatorTheme.themes;

  @themeExtension
  static const List<LinearProgressIndicatorTheme> linearProgressIndicatorTheme = LinearProgressIndicatorTheme.themes;
}
