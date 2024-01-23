import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_stepper_button_style.dart';

/// Implementation of the button used specifically in [YgStepper].
class YgStepperButton extends YgButtonBase<YgButtonBaseState> {
  const YgStepperButton({
    super.key,
    required this.icon,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
  });

  /// Widget under this widget in the widget tree.
  final YgColorableIconData icon;

  @override
  YgButtonBaseState createButtonState() {
    return YgButtonBaseState(
      disabled: disabled,
    );
  }

  @override
  void updateState(YgButtonBaseState state) {
    state.disabled.value = disabled;
  }

  @override
  YgButtonBaseStyle<YgButtonBaseState> createStyle(YgVsync vsync, YgButtonBaseState state) {
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
