import 'package:flutter/cupertino.dart';
import 'package:yggdrasil/src/components/yg_radio/properties/_properties.dart';
import 'package:yggdrasil/src/theme/_theme.dart';

class YgRadioStyle {
  const YgRadioStyle({
    required this.backgroundColor,
    required this.handleSize,
    required this.handleColor,
    required this.helperHandleSize,
    required this.mouseCursor,
  });

  factory YgRadioStyle.base(BuildContext context) {
    return YgRadioStyle(
      backgroundColor: YgRadioBackgroundColorProperty(
        selected: context.radioTheme.selectedBackgroundColor,
        selectedHovered: context.radioTheme.selectedHoveredBackgroundColor,
        selectedDisabled: context.radioTheme.selectedDisabledBackgroundColor,
        deselected: context.radioTheme.deselectedBackgroundColor,
        deselectedHovered: context.radioTheme.deselectedHoveredBackgroundColor,
        deselectedDisabled: context.radioTheme.deselectedDisabledBackgroundColor,
      ),
      handleSize: YgRadioHandleSizeProperty(
        selected: context.radioTheme.selectedHandleSize,
        deselected: context.radioTheme.deselectedHandleSize,
        disabled: context.radioTheme.deselectedHandleSize,
      ),
      handleColor: YgRadioHandleColorProperty(
        selected: context.radioTheme.selectedHandleColor,
        deselected: context.radioTheme.deselectedHandleColor,
        disabled: context.radioTheme.disabledHandleColor,
      ),
      helperHandleSize: YgRadioHelperHandleSizeProperty(
        disabledDeselected: context.radioTheme.disabledDeselectedHelperHandleSize,
        disabledSelected: context.radioTheme.disabledSelectedHelperHandleSize,
      ),
      mouseCursor: YgRadioMouseCursorProperty(
        enabled: SystemMouseCursors.click,
        disabled: SystemMouseCursors.basic,
      ),
    );
  }

  final YgRadioBackgroundColorProperty backgroundColor;
  final YgRadioHandleSizeProperty handleSize;
  final YgRadioHandleColorProperty handleColor;
  final YgRadioHelperHandleSizeProperty helperHandleSize;
  final YgRadioMouseCursorProperty mouseCursor;
}
