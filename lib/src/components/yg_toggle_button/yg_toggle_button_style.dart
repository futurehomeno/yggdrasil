import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'properties/_properties.dart';

class YgToggleButtonStyle {
  const YgToggleButtonStyle({
    required this.fillColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
    required this.mouseCursor,
  });

  factory YgToggleButtonStyle.base(BuildContext context) {
    final YgToggleButtonTheme toggleButtonTheme = context.toggleButtonTheme;

    return YgToggleButtonStyle(
      fillColor: YgToggleButtonFillColorProperty(
        selected: toggleButtonTheme.selectedFillColor,
        selectedHovered: toggleButtonTheme.selectedHoveredFillColor,
        selectedPressed: toggleButtonTheme.selectedPressedFillColor,
        selectedDisabled: toggleButtonTheme.selectedDisabledFillColor,
        deselected: toggleButtonTheme.deselectedFillColor,
        deselectedHovered: toggleButtonTheme.deselectedHoveredFillColor,
        deselectedPressed: toggleButtonTheme.deselectedPressedFillColor,
        deselectedDisabled: toggleButtonTheme.deselectedDisabledFillColor,
      ),
      borderColor: YgToggleButtonBorderColorProperty(
        selected: toggleButtonTheme.selectedBorderColor,
        selectedDisabled: toggleButtonTheme.selectedDisabledBorderColor,
        deselected: toggleButtonTheme.deselectedBorderColor,
        deselectedHovered: toggleButtonTheme.deselectedHoveredBorderColor,
        deselectedPressed: toggleButtonTheme.deselectedPressedBorderColor,
        deselectedDisabled: toggleButtonTheme.deselectedDisabledBorderColor,
      ),
      iconColor: YgToggleButtonIconColorProperty(
        selected: context.toggleButtonTheme.selectedIconColor,
        selectedDisabled: context.toggleButtonTheme.selectedDisabledIconColor,
        deselected: context.toggleButtonTheme.deselectedIconColor,
        deselectedDisabled: context.toggleButtonTheme.deselectedDisabledIconColor,
      ),
      textColor: YgToggleButtonTextColorProperty(
        selected: context.toggleButtonTheme.selectedTextColor,
        selectedDisabled: context.toggleButtonTheme.selectedDisabledTextColor,
        deselected: context.toggleButtonTheme.deselectedTextColor,
        deselectedDisabled: context.toggleButtonTheme.deselectedDisabledTextColor,
      ),
      mouseCursor: YgToggleButtonMouseCursorProperty(
        enabled: SystemMouseCursors.click,
        disabled: SystemMouseCursors.basic,
      ),
    );
  }

  final YgToggleButtonFillColorProperty fillColor;
  final YgToggleButtonBorderColorProperty borderColor;
  final YgToggleButtonIconColorProperty iconColor;
  final YgToggleButtonTextColorProperty textColor;
  final YgToggleButtonMouseCursorProperty mouseCursor;
}
