import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/bottom_sheet/_bottom_sheet.dart';

import 'buttons/_buttons.dart';
import 'tokens/tokens.dart';

part 'theme.tailor.dart';

// See build.yaml for theme build information.
@Tailor()
class _$YgTheme {
  @themeExtension
  static List<YgTokens> tokens = YgTokens.themes;

  @themeExtension
  static List<YgButtonThemes> buttonThemes = YgButtonThemes.themes;

  @themeExtension
  static List<YgBottomSheetThemes> bottomSheetTheme = YgBottomSheetThemes.themes;
}
