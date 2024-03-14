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
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    this.size = YgStepperButtonSize.large,
  });

  /// Widget under this widget in the widget tree.
  final YgColorableIconData icon;

  /// The size of the stepper button.
  final YgStepperButtonSize size;

  @override
  YgStepperButtonState createButtonState() {
    return YgStepperButtonState(
      disabled: disabled,
      size: size,
    );
  }

  @override
  void updateState(YgStepperButtonState state) {
    state.disabled.value = disabled;
    state.size.value = size;
  }

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
