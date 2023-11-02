import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_icon_button/yg_icon_button_style.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_icon_button_state.dart';

/// Base class for creating all YgIconButtons.
class YgIconButton extends StatefulWidget {
  const YgIconButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.size = YgIconButtonSize.medium,
    this.variant = YgIconButtonVariant.standard,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
  });

  final YgIconButtonVariant variant;
  final YgIconButtonSize size;
  final YgIcon child;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<YgIconButton> createState() => _YgIconButtonState();
}

class _YgIconButtonState extends State<YgIconButton> {
  late final YgIconButtonState _state = YgIconButtonState(
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
  void didUpdateWidget(covariant YgIconButton oldWidget) {
    _state.disabled.value = widget.onPressed == null;
    _state.variant.value = widget.variant;
    _state.size.value = widget.size;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return YgButtonBase<YgIconButtonState>(
      state: _state,
      createStyle: _createStyle,
      onPressed: widget.onPressed,
      onLongPress: widget.onLongPress,
      onHover: widget.onHover,
      onFocusChange: widget.onFocusChange,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      child: widget.child,
    );
  }

  YgIconButtonStyle _createStyle(YgVsync vsync) {
    return YgIconButtonStyle(
      state: _state,
      vsync: vsync,
    );
  }
}
