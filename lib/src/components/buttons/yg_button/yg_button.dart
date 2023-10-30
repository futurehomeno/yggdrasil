import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_button/enums/yg_button_state.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_button_style.dart';

part 'yg_button_with_leading_icon.dart';
part 'yg_button_with_trailing_icon.dart';

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
  // ignore: avoid-missing-enum-constant-in-map
  static const Map<MaterialState, YgButtonState> _statesMap = <MaterialState, YgButtonState>{
    MaterialState.disabled: YgButtonState.disabled,
    MaterialState.focused: YgButtonState.focused,
    MaterialState.hovered: YgButtonState.hovered,
    MaterialState.pressed: YgButtonState.pressed,
  };

  late final YgStatesController<YgButtonState> _controller = YgStatesController<YgButtonState>(<YgButtonState>{
    if (widget.onPressed == null) YgButtonState.disabled,
    YgButtonState.fromSize(widget.size),
    YgButtonState.fromVariant(widget.variant),
  });

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    _controller.updateSize(widget.size);
    _controller.updateVariant(widget.variant);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return YgButtonBase<YgButtonState>(
      createStyle: _createStyle,
      controller: _controller,
      statesToMaterialMap: _statesMap,
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
      controller: _controller,
      vsync: vsync,
    );
  }

  // context is used in overwriting classes.
  // ignore: avoid-unused-parameters
  Widget _buildChild(BuildContext context) {
    return widget.child;
  }
}
