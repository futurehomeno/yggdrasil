import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_icon_button/yg_icon_button_style.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '_yg_icon_button.dart';

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
  late final YgStatesController<YgIconButtonState> _controller = YgStatesController<YgIconButtonState>({
    if (widget.onPressed == null) YgIconButtonState.disabled,
    YgIconButtonState.fromSize(widget.size),
    YgIconButtonState.fromVariant(widget.variant),
  });

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YgIconButton oldWidget) {
    _controller.update(YgIconButtonState.disabled, widget.onPressed == null);
    _controller.updateVariant(widget.variant);
    _controller.updateSize(widget.size);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return YgButtonBase<YgIconButtonState>(
      controller: _controller,
      createStyle: _createStyle,
      focusedState: YgIconButtonState.focused,
      hoveredState: YgIconButtonState.hovered,
      pressedState: YgIconButtonState.pressed,
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
      controller: _controller,
      vsync: vsync,
    );
  }
}
