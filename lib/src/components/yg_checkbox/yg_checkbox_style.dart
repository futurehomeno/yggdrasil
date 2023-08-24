import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

import 'properties/_properties.dart';

class YgCheckboxStyle {
  const YgCheckboxStyle({
    required this.fillColor,
    required this.borderColor,
    required this.checkColor,
    required this.mouseCursor,
  });

  factory YgCheckboxStyle.base(BuildContext context) {
    final YgCheckboxTheme checkboxTheme = context.checkboxTheme;

    return YgCheckboxStyle(
      fillColor: YgCheckboxFillColorProperty(
        selected: checkboxTheme.selectedFillColor,
        selectedHovered: checkboxTheme.selectedHoveredFillColor,
        selectedPressed: checkboxTheme.selectedPressedFillColor,
        selectedError: checkboxTheme.selectedErrorFillColor,
        selectedDisabled: checkboxTheme.selectedDisabledFillColor,
        deselected: checkboxTheme.deselectedFillColor,
        deselectedHovered: checkboxTheme.deselectedHoveredFillColor,
        deselectedPressed: checkboxTheme.deselectedPressedFillColor,
        deselectedError: checkboxTheme.deselectedErrorFillColor,
        deselectedDisabled: checkboxTheme.deselectedDisabledFillColor,
      ),
      borderColor: YgCheckboxBorderColorProperty(
        selectedDisabled: checkboxTheme.selectedDisabledBorderColor,
        deselected: checkboxTheme.deselectedBorderColor,
        deselectedHovered: checkboxTheme.deselectedHoveredBorderColor,
        deselectedPressed: checkboxTheme.deselectedPressedBorderColor,
        deselectedError: checkboxTheme.deselectedErrorBorderColor,
        deselectedDisabled: checkboxTheme.deselectedDisabledBorderColor,
      ),
      checkColor: YgCheckboxCheckColorProperty(
        selected: context.checkboxTheme.selectedCheckColor,
        disabled: context.checkboxTheme.selectedDisabledCheckColor,
      ),
      mouseCursor: YgCheckboxMouseCursorProperty(
        enabled: SystemMouseCursors.click,
        disabled: SystemMouseCursors.basic,
      ),
    );
  }

  final YgCheckboxFillColorProperty fillColor;
  final YgCheckboxBorderColorProperty borderColor;
  final YgCheckboxCheckColorProperty checkColor;
  final YgCheckboxMouseCursorProperty mouseCursor;
}
