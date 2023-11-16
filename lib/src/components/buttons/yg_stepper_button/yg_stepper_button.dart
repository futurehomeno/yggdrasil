import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_stepper_button_style.dart';

/// Base class for creating all YgIconButtons.
class YgStepperButton extends YgButtonBase<YgButtonBaseState> {
  const YgStepperButton({
    super.key,
    required this.child,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    this.disabled = false,
  });

  final YgIcon child;
  final bool disabled;

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
    return child;
  }
}
