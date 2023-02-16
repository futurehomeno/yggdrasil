import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'buttons/button_themes.dart';

part 'theme.tailor.dart';

@Tailor()
class _$MyTheme {
  @themeExtension
  static List<YgButtonThemes> buttonThemes = YgButtonThemes.themes;
}
