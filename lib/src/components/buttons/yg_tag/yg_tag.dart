import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_tag_state.dart';
import 'yg_tag_style.dart';

part 'yg_tag_with_double_icon.dart';
part 'yg_tag_with_leading_icon.dart';
part 'yg_tag_with_trailing_icon.dart';

/// Base class for creating all [YgTag]s.
///
/// Tags are based on [ButtonStyleButton] and [ButtonStyle]
/// as the style is practically the same.
class YgTag extends StatefulWidget {
  const YgTag({
    super.key,
    required this.child,
    this.size = YgTagSize.medium,
    this.variant = YgTagVariant.neutral,
    this.weight = YgTagWeight.weak,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.onPressed,
  });

  // region Leading icon
  const factory YgTag.leadingIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    required YgIcon icon,
    Key? key,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    void Function()? onPressed,
    YgTagSize size,
    YgTagVariant variant,
    YgTagWeight weight,
  }) = _YgTagWithLeadingIcon;
  // endregion Leading icon

  // region Trailing icon
  const factory YgTag.trailingIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    required YgIcon icon,
    Key? key,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    void Function()? onPressed,
    YgTagSize size,
    YgTagVariant variant,
    YgTagWeight weight,
  }) = _YgTagWithTrailingIcon;

  // endregion Trailing icon

  // region Double icon
  const factory YgTag.doubleIcon({
    bool autofocus,
    required Widget child,
    FocusNode? focusNode,
    Key? key,
    required YgIcon leadingIcon,
    void Function(bool)? onFocusChange,
    void Function(bool)? onHover,
    void Function()? onLongPress,
    void Function()? onPressed,
    YgTagSize size,
    required YgIcon trailingIcon,
    YgTagVariant variant,
    YgTagWeight weight,
  }) = _YgTagWithDoubleIcon;
  // endregion Double icon

  final YgTagVariant variant;
  final YgTagSize size;
  final YgTagWeight weight;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget child;

  @override
  State<YgTag> createState() => _YgTagState<YgTag>();
}

class _YgTagState<W extends YgTag> extends State<W> {
  late final YgTagState _controller = YgTagState(
    size: widget.size,
    variant: widget.variant,
    weight: widget.weight,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant W oldWidget) {
    _controller.size.value = widget.size;
    _controller.variant.value = widget.variant;
    _controller.weight.value = widget.weight;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return YgButtonBase<YgTagState>(
      onPressed: widget.onPressed,
      onLongPress: widget.onLongPress,
      onHover: widget.onHover,
      onFocusChange: widget.onFocusChange,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      state: _controller,
      createStyle: _createStyle,
      child: _buildChild(context),
    );
  }

  YgTagStyle _createStyle(YgVsync vsync) {
    return YgTagStyle(
      state: _controller,
      vsync: vsync,
    );
  }

  // Has to be ignored since context is needed in classes overwriting this.
  // ignore: avoid-unused-parameters
  Widget _buildChild(BuildContext context) {
    return widget.child;
  }
}
