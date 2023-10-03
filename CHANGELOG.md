# 1.6.1+7 [03.10.2023 10:27]


# 1.6.1 [21.09.2023 16:05]

[feature] Added new icons 21.09.23.
[dev-improvement] Icon script now sorts icons.
[dev-improvement] Icon script now adds const to YgIcons class.

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
[improvement] Remove i18n and validators from YGG.
[improvement] Multiple improvements to the demo app.

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
[improvement] Set seed color to override purple default of m3.

# 1.2.0 [04.08.2023 09:42]

[dev-feature] Added YgText to make demo pages a little nicer.
[dev-improvement] Added sensible defaults for YgButton.
[dev-improvement] Button screen layout changed to better showcase buttons.
[dev-improvement] Tag screen layout changed to better showcase tags.
[dev-improvement] YgScreen renamed to DemoScreen.
[feature] Added link factory for YgListTile.
[feature] Added YgIconButton component.
[feature] Added YgSwitch component.
[feature] Added YgSwitchListTile component.
[fix] Breaking: useSvgColor renamed to useEmbeddedColor.
[fix] Breaking: YgIcon no longer allows actions. Replaced by YgIconButton.
[fix] Correct icon color now applied to text and link buttons.
[fix] Icon color is now correctly applied to disabled buttons.
[fix] Icon color is now correctly applied to disabled tags.
[fix] Several improvements to how YgTag handle text, icon and background themes.
[fix] Snackbar renamed SnackBar to match convention.
[improvement] Added debugFillProperties to YgIcon.
[improvement] Added Semantics to YgIcon.
[improvement] Changed from factory to named constructor for buttons and tags.
[improvement] Snack bars can now be triggered.

# 1.1.0 [25.07.2023 12:39]

[dev-feature] Added new screen showcasing all current icons. 
[feature] Added new set of icons 19.07.23.
[feature] Added new set of icons 24.07.23.
[feature] Added YgButtonGroup component.
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
[feature] Added sample screen for all icons.
[feature] Added sample screen for how to generate Lists.
[feature] Added support for consumer_light and consumer_dark themes.
[feature] Prepared support for professional_light and professional_dark themes.
[feature] Added first collection of new icons.
