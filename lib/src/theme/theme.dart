import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';
import 'package:yggdrasil/src/theme/wizard_header/_wizard_header.dart';

import 'app_bar/_app_bar.dart';
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
import 'fields/_fields.dart';
import 'gauge/_gauge.dart';
import 'icon/_icon.dart';
import 'icon_button/_icon_button.dart';
import 'internal/_internal.dart';
import 'list_tile/_list_tile.dart';
import 'progress_indicator/_progress_indicator.dart';
import 'radio/_radio.dart';
import 'section/_section.dart';
import 'snack_bar/_snack_bar.dart';
import 'switch/_switch.dart';
import 'tag/_tag.dart';
import 'text_link/_text_link.dart';
import 'toggle_button/_toggle_button.dart';
import 'tokens/_tokens.dart';

part 'theme.tailor.dart';

// See build.yaml for theme build information.
@Tailor()
class _$YgTheme {
  // region Core themes

  @themeExtension
  static final List<YgTokens> tokens = YgTokens.themes;

  @themeExtension
  static final List<YgDefaults> defaults = YgDefaults.themes;

  @themeExtension
  static final List<YgInternalTheme> internalTheme = YgInternalTheme.themes;

  // endregion

  // region Component themes

  @themeExtension
  static final List<YgAppBarTheme> appBarTheme = YgAppBarTheme.themes;

  @themeExtension
  static final List<YgBadgeTheme> badgeTheme = YgBadgeTheme.themes;

  @themeExtension
  static final List<YgBottomSheetTheme> bottomSheetTheme = YgBottomSheetTheme.themes;

  @themeExtension
  static final List<YgButtonTheme> buttonTheme = YgButtonTheme.themes;

  @themeExtension
  static final List<YgButtonGroupTheme> buttonGroupTheme = YgButtonGroupTheme.themes;

  @themeExtension
  static final List<YgCalloutTheme> calloutTheme = YgCalloutTheme.themes;

  @themeExtension
  static final List<YgCardTheme> cardTheme = YgCardTheme.themes;

  @themeExtension
  static final List<YgCheckboxTheme> checkboxTheme = YgCheckboxTheme.themes;

  @themeExtension
  static final List<YgDialogTheme> dialogTheme = YgDialogTheme.themes;

  @themeExtension
  static final List<YgDividerTheme> dividerTheme = YgDividerTheme.themes;

  @themeExtension
  static final List<YgFieldTheme> fieldTheme = YgFieldTheme.themes;

  @themeExtension
  static final List<YgGaugeTheme> gaugeTheme = YgGaugeTheme.themes;

  @themeExtension
  static final List<YgIconTheme> iconTheme = YgIconTheme.themes;

  @themeExtension
  static final List<YgIconButtonTheme> iconButtonTheme = YgIconButtonTheme.themes;

  @themeExtension
  static final List<YgListTileTheme> listTileTheme = YgListTileTheme.themes;

  @themeExtension
  static final List<YgProgressIndicatorTheme> progressIndicatorTheme = YgProgressIndicatorTheme.themes;

  @themeExtension
  static final List<YgRadioTheme> radioTheme = YgRadioTheme.themes;

  @themeExtension
  static final List<YgSectionTheme> sectionTheme = YgSectionTheme.themes;

  @themeExtension
  static final List<YgSnackBarTheme> snackBarTheme = YgSnackBarTheme.themes;

  @themeExtension
  static final List<YgSwitchTheme> switchTheme = YgSwitchTheme.themes;

  @themeExtension
  static final List<YgTagTheme> tagTheme = YgTagTheme.themes;

  @themeExtension
  static final List<YgTextLinkTheme> textLinkTheme = YgTextLinkTheme.themes;

  @themeExtension
  static final List<YgToggleButtonTheme> toggleButtonTheme = YgToggleButtonTheme.themes;

  @themeExtension
  static final List<YgWizardHeaderTheme> wizardHeaderTheme = YgWizardHeaderTheme.themes;

  // endregion
}
