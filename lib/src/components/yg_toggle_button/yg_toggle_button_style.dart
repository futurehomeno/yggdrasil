import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'properties/_properties.dart';

class YgToggleButtonStyle {
  const YgToggleButtonStyle({
    required this.fillColor,
    required this.borderColor,
    required this.iconColor,
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
        deselectedError: toggleButtonTheme.deselectedErrorFillColor,
        deselectedDisabled: toggleButtonTheme.deselectedDisabledFillColor,
      ),
      borderColor: YgToggleButtonBorderColorProperty(
        selectedDisabled: toggleButtonTheme.selectedDisabledBorderColor,
        deselected: toggleButtonTheme.deselectedBorderColor,
        deselectedHovered: toggleButtonTheme.deselectedHoveredBorderColor,
        deselectedPressed: toggleButtonTheme.deselectedPressedBorderColor,
        deselectedError: toggleButtonTheme.deselectedErrorBorderColor,
        deselectedDisabled: toggleButtonTheme.deselectedDisabledBorderColor,
      ),
      iconColor: YgToggleButtonIconColorProperty(
        selected: context.toggleButtonTheme.selectedCheckColor,
        disabled: context.toggleButtonTheme.selectedDisabledCheckColor,
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
  final YgToggleButtonMouseCursorProperty mouseCursor;
}
