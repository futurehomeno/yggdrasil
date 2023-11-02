import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_button_state.dart';
import 'yg_button_style.dart';

part 'yg_button_with_leading_icon.dart';
part 'yg_button_with_trailing_icon.dart';

// TODO(Tim): Look in to internalizing the state controller if support for
// multiple variant enums has been added to YgStatesController.
class YgButton extends StatefulWidget {
  const YgButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.size = YgButtonSize.medium,
    this.variant = YgButtonVariant.primary,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
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

  final Widget child;
  final YgButtonVariant variant;
  final YgButtonSize size;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<YgButton> createState() => _YgButtonState<YgButton>();
}

class _YgButtonState<T extends YgButton> extends State<T> {
  late final YgButtonState _state = YgButtonState(
    disabled: widget.onPressed == null,
    size: widget.size,
    variant: widget.variant,
  );

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    _state.size.value = widget.size;
    _state.variant.value = widget.variant;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return YgButtonBase<YgButtonState>(
      createStyle: _createStyle,
      state: _state,
      onPressed: widget.onPressed,
      onLongPress: widget.onLongPress,
      onHover: widget.onHover,
      onFocusChange: widget.onFocusChange,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      child: _buildChild(context),
    );
  }

  YgButtonStyle _createStyle(YgVsync vsync) {
    return YgButtonStyle(
      state: _state,
      vsync: vsync,
    );
  }

  // context is used in overwriting classes.
  // ignore: avoid-unused-parameters
  Widget _buildChild(BuildContext context) {
    return widget.child;
  }
}
