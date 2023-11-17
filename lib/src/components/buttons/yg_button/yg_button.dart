import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_button_state.dart';
import 'yg_button_style.dart';

part 'yg_button_with_leading_icon.dart';
part 'yg_button_with_trailing_icon.dart';

/// Base class for creating all Yg buttons.
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

  /// Button with a leading icon
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

  /// Button with a trailing icon.
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

  /// The variant of the button.
  ///
  /// For specific info see [YgButtonVariant].
  final YgButtonVariant variant;

  /// The size of the button.
  ///
  /// For specific info see [YgButtonSize].
  final YgButtonSize size;

  /// The widget rendered under this widget in the widget tree.
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
