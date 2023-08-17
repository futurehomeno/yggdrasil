import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'extensions/_extensions.dart';

part 'icon_theme.tailor.dart';

@tailorComponent
class _$YgIconTheme {
  @themeExtension
  static final List<YgIconSizeTheme> size = YgIconSizeTheme.themes;

  @themeExtension
  static final List<YgIconTapSizeTheme> tapSize = YgIconTapSizeTheme.themes;
}
