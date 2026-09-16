import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'enums/_enums.dart';
import 'yg_stepper_button_state.dart';
import 'yg_stepper_button_style.dart';

/// Implementation of the button used specifically in [YgStepper].
class YgStepperButton extends YgButtonBase<YgStepperButtonState> {
  const YgStepperButton({
    super.key,
    required this.icon,
    super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    super.onTapEnd,
    super.onTapStart,
    this.size = YgStepperButtonSize.large,
    this.variant = YgStepperButtonVariant.outlined,
    this.color,
    this.disabled = false,
  });

  /// Widget under this widget in the widget tree.
  final YgColorableIconData icon;

  /// The size of the stepper button.
  final YgStepperButtonSize size;

  /// The variant of the stepper button.
  final YgStepperButtonVariant variant;

  /// Optional color override for the stepper button.
  ///
  /// Replaces the outline and icon color for [YgStepperButtonVariant.outlined]
  /// and the background color for [YgStepperButtonVariant.filled]. Ignored
  /// when the button is disabled.
  final Color? color;

  @override
  YgStepperButtonState createButtonState() {
    return YgStepperButtonState(
      disabled: disabled,
      size: size,
      variant: variant,
      color: color,
    );
  }

  @override
  void updateState(YgStepperButtonState state) {
    state.disabled.value = disabled;
    state.size.value = size;
    state.variant.value = variant;
    state.color.value = color;
  }

  @override
  final bool disabled;

  @override
  YgButtonBaseStyle<YgStepperButtonState> createStyle(YgVsync vsync, YgStepperButtonState state) {
    return YgStepperButtonStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return YgIcon(icon);
  }
}
