import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'badge/_badge.dart';
import 'bottom_sheet/_bottom_sheet.dart';
import 'buttons/_buttons.dart';
import 'callout/_callout.dart';
import 'card/_card.dart';
import 'dialog/_dialog.dart';
import 'internal/_internal.dart';
import 'tags/tag_themes.dart';
import 'text_link/text_link_themes.dart';
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
  static List<YgCalloutThemes> calloutThemes = YgCalloutThemes.themes;

  @themeExtension
  static List<YgDialogThemes> dialogTheme = YgDialogThemes.themes;

  @themeExtension
  static List<YgTagThemes> tagThemes = YgTagThemes.themes;

  @themeExtension
  static List<YgTextLinkThemes> textLinkThemes = YgTextLinkThemes.themes;

  @themeExtension
  static List<YgInternalThemes> internalThemes = YgInternalThemes.themes;
}
