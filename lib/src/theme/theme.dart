import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'badge/_badge.dart';
import 'bottom_sheet/_bottom_sheet.dart';
import 'button/_button.dart';
import 'button_group/_button_group.dart';
import 'callout/_callout.dart';
import 'card/_card.dart';
import 'checkbox/_checkbox.dart';
import 'defaults/_defaults.dart';
import 'dialog/_dialog.dart';
import 'divider/_divider.dart';
import 'gauge/_gauge.dart';
import 'icon/_icon.dart';
import 'icon_button/_icon_button.dart';
import 'internal/_internal.dart';
import 'list_tile/_list_tile.dart';
import 'progress_indicator/_progress_indicator.dart';
import 'radio/_radio.dart';
import 'snack_bar/_snack_bar.dart';
import 'switch/_switch.dart';
import 'tag/_tag.dart';
import 'text_field/_text_field.dart';
import 'text_link/_text_link.dart';
import 'tokens/_tokens.dart';

part 'theme.tailor.dart';

// See build.yaml for theme build information.
@Tailor()
class _$YgTheme {
  @themeExtension
  static const List<YgTokens> tokens = YgTokens.themes;

  @themeExtension
  static const List<YgDefaults> defaults = YgDefaults.themes;

  @themeExtension
  static const List<YgBadgeTheme> badgeTheme = YgBadgeTheme.themes;

  @themeExtension
  static const List<YgBottomSheetTheme> bottomSheetTheme = YgBottomSheetTheme.themes;

  @themeExtension
  static const List<YgButtonTheme> buttonTheme = YgButtonTheme.themes;

  @themeExtension
  static const List<YgButtonGroupTheme> buttonGroupTheme = YgButtonGroupTheme.themes;

  @themeExtension
  static const List<YgCardTheme> cardTheme = YgCardTheme.themes;

  @themeExtension
  static const List<YgCheckboxTheme> checkboxTheme = YgCheckboxTheme.themes;

  @themeExtension
  static const List<YgDialogTheme> dialogTheme = YgDialogTheme.themes;

  @themeExtension
  static const List<YgCalloutTheme> calloutTheme = YgCalloutTheme.themes;

  @themeExtension
  static const List<YgDividerTheme> dividerTheme = YgDividerTheme.themes;

  @themeExtension
  static const List<YgGaugeTheme> gaugeTheme = YgGaugeTheme.themes;

  @themeExtension
  static const List<YgIconTheme> iconTheme = YgIconTheme.themes;

  @themeExtension
  static const List<YgIconButtonTheme> iconButtonTheme = YgIconButtonTheme.themes;

  @themeExtension
  static const List<YgListTileTheme> listTileTheme = YgListTileTheme.themes;

  @themeExtension
  static const List<YgRadioTheme> radioTheme = YgRadioTheme.themes;

  @themeExtension
  static const List<YgProgressIndicatorTheme> progressIndicatorTheme = YgProgressIndicatorTheme.themes;

  @themeExtension
  static const List<YgSnackBarTheme> snackBarTheme = YgSnackBarTheme.themes;

  @themeExtension
  static const List<YgSwitchTheme> switchTheme = YgSwitchTheme.themes;

  @themeExtension
  static const List<YgTagTheme> tagTheme = YgTagTheme.themes;

  @themeExtension
  static const List<YgTextLinkTheme> textLinkTheme = YgTextLinkTheme.themes;

  @themeExtension
  static const List<YgInternalTheme> internalTheme = YgInternalTheme.themes;

  @themeExtension
  static const List<YgTextFieldTheme> textInputTheme = YgTextFieldTheme.themes;
}
