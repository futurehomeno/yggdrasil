import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/utils/_utils.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_icon_button_state.dart';
import 'yg_icon_button_style.dart';

/// Base class for creating all YgIconButtons.
class YgIconButton extends YgButtonBase<YgIconButtonState> with StatefulWidgetDebugMixin {
  const YgIconButton({
    super.key,
    required this.child,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    this.size = YgIconButtonSize.medium,
    this.variant = YgIconButtonVariant.standard,
  });

  final YgIconButtonVariant variant;
  final YgIconButtonSize size;
  final YgIcon child;

  @override
  YgIconButtonState createButtonState() {
    return YgIconButtonState(
      disabled: onPressed == null,
      size: size,
      variant: variant,
    );
  }

  @override
  void updateState(YgIconButtonState state) {
    state.disabled.value = onPressed == null;
    state.variant.value = variant;
    state.size.value = size;
  }

  @override
  YgButtonBaseStyle<YgIconButtonState> createStyle(YgVsync vsync, YgIconButtonState state) {
    return YgIconButtonStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return child;
  }
}
