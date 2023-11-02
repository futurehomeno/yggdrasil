import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_button_state.dart';
import 'yg_button_style.dart';

part 'yg_button_with_leading_icon.dart';
part 'yg_button_with_trailing_icon.dart';

// TODO(Tim): Look in to internalizing the state controller if support for
// multiple variant enums has been added to YgStatesController.
class YgButton extends YgButtonBase<YgButtonState> {
  const YgButton({
    super.key,
    required this.child,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    this.size = YgButtonSize.medium,
    this.variant = YgButtonVariant.primary,
  });

  const factory YgButton.leadingIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    required YgIcon icon,
    Key? key,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    required void Function()? onPressed,
    YgButtonSize size,
    YgButtonVariant variant,
  }) = _YgButtonWithLeadingIcon;

  const factory YgButton.trailingIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    required YgIcon icon,
    Key? key,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    required void Function()? onPressed,
    YgButtonSize size,
    YgButtonVariant variant,
  }) = _YgButtonWithTrailingIcon;

  final YgButtonVariant variant;
  final YgButtonSize size;
  final Widget child;

  @override
  YgButtonState createButtonState() {
    return YgButtonState(
      disabled: onPressed == null,
      size: size,
      variant: variant,
    );
  }

  @override
  void updateState(YgButtonState state) {
    state.size.value = size;
    state.variant.value = variant;
  }

  @override
  YgButtonBaseStyle<YgButtonState> createStyle(YgVsync vsync, YgButtonState state) {
    return YgButtonStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return child;
  }
}
