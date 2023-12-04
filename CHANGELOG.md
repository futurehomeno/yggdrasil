# 1.8.2 [2023-11-29T18:03:14.119511]

- [dev-change] No longer exporting internal utils.
- [dev-change] Renamed YgSection.base has been moved to the primary constructor.
- [feature] Added YgExpandingListTile.
- [feature] Added YgExpandingSection.

# 1.8.1 [21.11.2023 13:54]

- [dev-fix] Applied changes needed due to the flutter and dependency updates.
- [dev-improvement] Added "variables" to Codemagic config.
- [dev-improvement] Updated flutter and dependencies.
- [fix] Fixed buttons of any type not responding to a change in disabled state.

# 1.8.0 [20.11.2023 08:37]

## Breaking Changes

YgButtonGroup no longer accepts mainAxisAlignment, mainAxisSize and crossAxisAlignment, and Axis is now required. This is done to support the new vertical and horizontal constructors instead. For most cases, adding `.vertical` should be enough to update as we almost exclusively have vertical button groups.

## Other Changes

- [dev-fix] Add key property back to list tiles.
- [dev-improvement] Added golden tests for YgButton component [DEV-2263].
- [dev-improvement] Added golden tests for YgButtonGroup [DEV-2284].
- [dev-improvement] Added golden tests for YgSection component [DEV-2373].
- [dev-improvement] Added golden tests for YgSwitch component [DEV-2264].
- [dev-improvement] Added golden tests for YgTextLink component [DEV-2315].
- [dev-improvement] Added golden tests for YgToggleButton component [DEV-2340].
- [fix] Fixed an issue where YgToggleButton with long text did not render correctly.
- [fix] Fixed an issue where YgToggleButton would take up too much space.
- [fix] Fixed incorrect padding on list tiles without leading or trailing widgets.
- [improvement] Added vertical and horizontal constructors for YgButtonGroup.
- [improvement] Ensure correct spacing for horizontal buttons in YgButtonGroup.

# 1.7.0 [17.11.2023 09:03]

## Breaking Changes

Added `colorful` suffix to some icons indicating that they have embedded colors and should not be overwritten.

## Other Changes

- [dev-feature] Added YgStatesController [DEV-1654].
- [dev-feature] Added custom YgFocusableActionDetector widget [DEV-1712].
- [dev-improvement] Added golden tests for YgBadge component [DEV-2244].
- [dev-improvement] Added golden tests for YgBottomSheet component [DEV-2376].
- [dev-improvement] Added golden tests for YgCard component [DEV-2246].
- [dev-improvement] Added golden tests for YgCheckbox component [DEV-2262].
- [dev-improvement] Added golden tests for YgCheckboxListTile component [DEV-2344].
- [dev-improvement] Added golden tests for YgDialog component [DEV-2377].
- [dev-improvement] Added golden tests for YgDivider component [DEV-2364].
- [dev-improvement] Added golden tests for YgGauge component [DEV-2307].
- [dev-improvement] Added golden tests for YgIcon component [DEV-2359].
- [dev-improvement] Added golden tests for YgIconButton component [DEV-2360].
- [dev-improvement] Added golden tests for YgListTile component [DEV-2249].
- [dev-improvement] Added golden tests for YgProgressIndicators components [DEV-2313].
- [dev-improvement] Added golden tests for YgRadio component [DEV-2345].
- [dev-improvement] Added golden tests for YgRadioGroup component [DEV-2357].
- [dev-improvement] Added golden tests for YgRadioItem component [DEV-2356].
- [dev-improvement] Added golden tests for YgRadioListTile component [DEV-2345].
- [dev-improvement] Added golden tests for YgSwitchListTile component [DEV-2346].
- [dev-improvement] Added golden tests for YgTag component [DEV-2248].
- [dev-improvement] Added support for sliver debugging.
- [dev-improvement] Moved YgButton, YgTextLink, YgIconButton, YgTag, YgRadio, YgTextField and YgDropdownField to YgStates.
- [feature] Added YgAppBar and YgSliverAppBar components [DEV-1143].
- [feature] Added YgStepper component [DEV-2333].
- [feature] Added YgTab and YgTabBar components [DEV-1137].
- [feature] Added YgWizardHeader component [DEV-1144].
- [feature] Added new icons: 14.11.23.
- [fix] Dropdown field now shows ink ripple when activated using keyboard.
- [fix] YgCheckbox no longer expands to take up as much space as possible.

# 1.6.17+22 [25.10.2023 12:52]

- [dev-fix] Fixed changelog sent to slack.
- [feature] Added leadingWidget parameter to YgSwitchListTile.

# 1.6.12+17 [12.10.2023 12:49]

- [dev-fix] Added Slack notification when new version is released.
- [fix] YgSnackBar leading icon background now correctly has a diameter of lg.
- [fix] YgSnackBar text now correctly has a min height of lg.
- [improvement] YgSnackBar now supports a custom scaffoldMessengerKey.
- [improvement] YgSnackBar now supports passing a custom onPressed callback.

# 1.6.8+11 [11.10.2023 09:29]

- [fix] YgGauge no longer indicates the wrong value

# 1.6.5+10 [04.10.2023 13:18]

- [dev-improvement] Improved exporting of YgThemes, preventing exposure in dependent applications [DEV-1969].
- [dev-improvement] Improved the .gitingore file to ignore all unnecessary Flutter files [DEV-1366].
- [fix] Fixed an SVG parsing error for chargerQuestion and playQuestion.
- [improvement] Added search to icon list screen.

# 1.6.1 [21.09.2023 16:05]

[dev-improvement] Icon script now adds const to YgIcons class.
[dev-improvement] Icon script now sorts icons.
[feature] Added new icons 21.09.23.

# 1.6.0 [14.09.2023 08:35]

[feature] Added YgDropdownField and YgDropdownFormField components.
[feature] Added YgToggleButton component.
[improvement] Added different types for debugging outlines and updated interface to toggle them.
[improvement] YgTextFieldSize is now YgFieldSize and is compatible with other yggdrasil fields.
[improvement] YgTextFieldVariant is now YgFieldVariant and is compatible with other yggdrasil fields.

# 1.5.3 [01.09.2023 11:28]

[fix] Limit YgRadio- and YgCheckboxGroup to contain max 5 items.
[fix] The focusNode and controller on a text field are no longer disposed when they are user specified.

# 1.5.2 [30.08.2023 13:42]

[fix] YgGauge no longer accepts values that are not between the min and max values.
[fix] YgGauge no longer breaks when changing value from non-null to null.

# 1.5.1 [30.08.2023 09:48]

[fix] Enable list tiles to have long titles.
[fix] Wrap YgGauge in Center to correct alignment in non-square boxes.

# 1.5.0 [25.08.2023 18:11]

[dev-feature] Added DCM.
[feature] Add YgSectionComponent.
[feature] New icons (25/08/23).
[fix] Close button should not be centered when callout has desc only.
[improvement] Multiple improvements to the demo app.
[improvement] Remove i18n and validators from YGG.

# 1.4.0 [17.08.2023 08:55]

[dev-feature] Added YgDebug widget for designers to inspect widget sizes.
[dev-improvement] Replaced transparent color in material widget with MaterialType.transparent.
[feature] Added YgCheckbox component.
[feature] Added YgCheckboxGroup component.
[feature] Added YgCheckboxItem component.
[feature] Added YgCheckboxListTile component.
[feature] Added YgGauge component.
[feature] Added YgRadioGroup component.
[feature] Added YgRadioItem component.
[feature] Added YgTextInput.
[fix] Added focus and keybinding to YgRadio.
[fix] Error message should no longer take up space when not visible.
[improvement] added spacing between widgets in example app.
[improvement] added the option to switch to business theme.

# 1.3.0 [11.08.2023 14:30]

[feature] Added YgCircularProgressIndicator component.
[feature] Added YgLinearProgressIndicator component.
[feature] Added YgRadio component.
[feature] Added YgRadioListTile component.
[fix] "Info" icon in title no longer floats upwards.
[fix] Fixed padding and spacing for the YgBottomSheet.
[improvement] Adjusted ListTile spacing according to design.

# 1.2.1 [04.08.2023 13:46]

[dev-improvement] Card screen reworked to better showcase examples.
[dev-improvement] Changed SwitchListTile example with trailing widget to use IconButton.
[fix] Changed import of Open Sans to OpenSans to that it actually imports.
[fix] Changed size of IconButton for SnackBar to small.
[improvement] Set seed color to override purple default of M3.

# 1.2.0 [04.08.2023 09:42]

[dev-feature] Added YgText to make demo pages a little nicer.
[dev-improvement] Added sensible defaults for YgButton.
[dev-improvement] Button screen layout changed to better showcase buttons.
[dev-improvement] Tag screen layout changed to better showcase tags.
[dev-improvement] YgScreen renamed to DemoScreen.
[feature] Added YgIconButton component.
[feature] Added YgSwitch component.
[feature] Added YgSwitchListTile component.
[feature] Added link factory for YgListTile.
[fix] Breaking: YgIcon no longer allows actions. Replaced by YgIconButton.
[fix] Breaking: useSvgColor renamed to useEmbeddedColor.
[fix] Correct icon color now applied to text and link buttons.
[fix] Icon color is now correctly applied to disabled buttons.
[fix] Icon color is now correctly applied to disabled tags.
[fix] Several improvements to how YgTag handle text, icon and background themes.
[fix] Snackbar renamed SnackBar to match convention.
[improvement] Added Semantics to YgIcon.
[improvement] Added debugFillProperties to YgIcon.
[improvement] Changed from factory to named constructor for buttons and tags.
[improvement] Snack bars can now be triggered.

# 1.1.0 [25.07.2023 12:39]

[dev-feature] Added new screen showcasing all current icons. 
[feature] Added YgButtonGroup component.
[feature] Added new set of icons 19.07.23.
[feature] Added new set of icons 24.07.23.
[feature] Relaxed requirements for Dialog building, allowing cubits to be used.
[fix] Changed ListTile title size to sectionHeading3Medium from pageHeading3Medium.
[fix] Dialog now supports not passing a button group.
[fix] Dialog now supports passing a widget as a header widget (replaces icon).
[improvement] Updated padding and spacing for dialog with new pattern.

# 1.0.0 [14.07.2023 17:00]

[feature] Added component ygBadge.
[feature] Added component ygBottomSheet.
[feature] Added component ygButton.
[feature] Added component ygCallout.
[feature] Added component ygCard.
[feature] Added component ygDialog.
[feature] Added component ygDivider.
[feature] Added component ygIcon.
[feature] Added component ygListTile.
[feature] Added component ygSnackbar.
[feature] Added component ygTag.
[feature] Added component ygTextLink.
[feature] Added first collection of new icons.
[feature] Added sample screen for all icons.
[feature] Added sample screen for how to generate Lists.
[feature] Added support for consumer_light and consumer_dark themes.
[feature] Prepared support for professional_light and professional_dark themes.
