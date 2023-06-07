import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/badge/_badge.dart';
import 'package:yggdrasil/src/theme/internal/internal.dart';

import 'bottom_sheet/_bottom_sheet.dart';
import 'buttons/_buttons.dart';
import 'dialog/_dialog.dart';
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

  @themeExtension
  static List<YgBadgeTheme> badgeTheme = YgBadgeTheme.themes;

  @themeExtension
  static List<YgDialogThemes> dialogTheme = YgDialogThemes.themes;

  @themeExtension
  static List<YgInternalTheme> internalTheme = YgInternalTheme.themes;
}
