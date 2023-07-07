import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/tags/_tags.dart';

import '_theme.dart';
import 'tokens/tokens.dart';

part 'theme.tailor.dart';

// See build.yaml for theme build information.
@Tailor()
class _$YgTheme {
  @themeExtension
  static List<YgTokens> tokens = YgTokens.themes;

  @themeExtension
  static List<YgBadgeThemes> badgeThemes = YgBadgeThemes.themes;

  @themeExtension
  static List<YgBottomSheetThemes> bottomSheetThemes = YgBottomSheetThemes.themes;

  @themeExtension
  static List<YgButtonThemes> buttonThemes = YgButtonThemes.themes;

  @themeExtension
  static List<YgCardThemes> cardThemes = YgCardThemes.themes;

  @themeExtension
  static List<YgDialogThemes> dialogThemes = YgDialogThemes.themes;

  @themeExtension
  static List<YgIconThemes> iconThemes = YgIconThemes.themes;

  @themeExtension
  static List<YgListTileThemes> listTileThemes = YgListTileThemes.themes;

  @themeExtension
  static List<YgTagThemes> tagThemes = YgTagThemes.themes;

  @themeExtension
  static List<YgInternalThemes> internalThemes = YgInternalThemes.themes;
}
