import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import '_theme.dart';
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
  static final List<YgAvatarTheme> avatarTheme = YgAvatarTheme.themes;

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
  static final List<YgLayoutTheme> layoutTheme = YgLayoutTheme.themes;

  @themeExtension
  static final List<YgListTileTheme> listTileTheme = YgListTileTheme.themes;

  @themeExtension
  static final List<YgMiniBarGraphTheme> miniBarGraphTheme = YgMiniBarGraphTheme.themes;

  @themeExtension
  static final List<YgMobileScannerContainerTheme> mobileScannerContainerTheme = YgMobileScannerContainerTheme.themes;

  @themeExtension
  static final List<YgPickerTheme> pickerTheme = YgPickerTheme.themes;

  @themeExtension
  static final List<YgProgressIndicatorTheme> progressIndicatorTheme = YgProgressIndicatorTheme.themes;

  @themeExtension
  static final List<YgPulseTheme> pulseTheme = YgPulseTheme.themes;

  @themeExtension
  static final List<YgRadioTheme> radioTheme = YgRadioTheme.themes;

  @themeExtension
  static final List<YgSearchBarTheme> searchBarTheme = YgSearchBarTheme.themes;

  @themeExtension
  static final List<YgSearchFieldTheme> searchFieldTheme = YgSearchFieldTheme.themes;

  @themeExtension
  static final List<YgSearchModalTheme> searchModalTheme = YgSearchModalTheme.themes;

  @themeExtension
  static final List<YgSectionTheme> sectionTheme = YgSectionTheme.themes;

  @themeExtension
  static final List<YgSegmentedButtonTheme> segmentedButtonTheme = YgSegmentedButtonTheme.themes;

  @themeExtension
  static final List<YgSliderTheme> sliderTheme = YgSliderTheme.themes;

  @themeExtension
  static final List<YgSnackBarTheme> snackBarTheme = YgSnackBarTheme.themes;

  @themeExtension
  static final List<YgStepperTheme> stepperTheme = YgStepperTheme.themes;

  @themeExtension
  static final List<YgStepperButtonTheme> stepperButtonTheme = YgStepperButtonTheme.themes;

  @themeExtension
  static final List<YgSwitchTheme> switchTheme = YgSwitchTheme.themes;

  @themeExtension
  static final List<YgTabsTheme> tabsTheme = YgTabsTheme.themes;

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
