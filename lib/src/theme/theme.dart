import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/progress_indicator/progress_indicator_theme.dart';

import 'badge/_badge.dart';
import 'bottom_sheet/_bottom_sheet.dart';
import 'button/_button.dart';
import 'button_group/_button_group.dart';
import 'callout/_callout.dart';
import 'card/_card.dart';
import 'defaults/_defaults.dart';
import 'dialog/_dialog.dart';
import 'divider/_divider.dart';
import 'icon/_icon.dart';
import 'icon_button/_icon_button.dart';
import 'internal/_internal.dart';
import 'list_tile/_list_tile.dart';
import 'progress_indicator/_progress_indicator.dart';
import 'snack_bar/_snack_bar.dart';
import 'switch/_switch.dart';
import 'tag/_tag.dart';
import 'text_link/_text_link.dart';
import 'tokens/_tokens.dart';

part 'theme.tailor.dart';

// See build.yaml for theme build information.
@Tailor()
class _$YgTheme {
  @themeExtension
  static List<YgTokens> tokens = YgTokens.themes;

  @themeExtension
  static List<YgDefaults> defaults = YgDefaults.themes;

  @themeExtension
  static List<YgBadgeTheme> badgeTheme = YgBadgeTheme.themes;

  @themeExtension
  static List<YgBottomSheetTheme> bottomSheetTheme = YgBottomSheetTheme.themes;

  @themeExtension
  static List<YgButtonTheme> buttonTheme = YgButtonTheme.themes;

  @themeExtension
  static List<YgButtonGroupTheme> buttonGroupTheme = YgButtonGroupTheme.themes;

  @themeExtension
  static List<YgCardTheme> cardTheme = YgCardTheme.themes;

  @themeExtension
  static List<YgDialogTheme> dialogTheme = YgDialogTheme.themes;

  @themeExtension
  static List<YgCalloutTheme> calloutTheme = YgCalloutTheme.themes;

  @themeExtension
  static List<YgDividerTheme> dividerTheme = YgDividerTheme.themes;

  @themeExtension
  static List<YgIconTheme> iconTheme = YgIconTheme.themes;

  @themeExtension
  static List<YgIconButtonTheme> iconButtonTheme = YgIconButtonTheme.themes;

  @themeExtension
  static List<YgListTileTheme> listTileTheme = YgListTileTheme.themes;

  @themeExtension
  static List<YgProgressIndicatorTheme> progressIndicatorTheme = YgProgressIndicatorTheme.themes;

  @themeExtension
  static List<YgSnackBarTheme> snackBarTheme = YgSnackBarTheme.themes;

  @themeExtension
  static List<YgSwitchTheme> switchTheme = YgSwitchTheme.themes;

  @themeExtension
  static List<YgTagTheme> tagTheme = YgTagTheme.themes;

  @themeExtension
  static List<YgTextLinkTheme> textLinkTheme = YgTextLinkTheme.themes;

  @themeExtension
  static List<YgInternalTheme> internalTheme = YgInternalTheme.themes;
}
