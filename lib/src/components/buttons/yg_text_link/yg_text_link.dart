import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_text_link/yg_text_link_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import '_yg_text_link.dart';

/// Text link button implementation.
class YgTextLink extends StatefulWidget {
  const YgTextLink({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = YgTextLinkSize.small,
    this.weight = YgTextLinkWeight.weak,
    this.external = false,
    this.autofocus = false,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
  });

  final String text;
  final YgTextLinkSize size;
  final YgTextLinkWeight weight;
  final bool external;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<YgTextLink> createState() => _YgTextLinkState();
}

class _YgTextLinkState extends State<YgTextLink> {
  late final YgStatesController<YgTextLinkState> _controller = YgStatesController<YgTextLinkState>(<YgTextLinkState>{
    if (widget.onPressed == null) YgTextLinkState.disabled,
    YgTextLinkState.fromSize(widget.size),
    YgTextLinkState.fromWeight(widget.weight),
  });

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant YgTextLink oldWidget) {
    _controller.update(YgTextLinkState.disabled, widget.onPressed == null);
    _controller.updateSize(widget.size);
    _controller.updateWeight(widget.weight);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return YgButtonBase<YgTextLinkState>(
      focusedState: YgTextLinkState.focused,
      hoveredState: YgTextLinkState.hovered,
      pressedState: YgTextLinkState.pressed,
      controller: _controller,
      createStyle: _createStyle,
      onPressed: widget.onPressed,
      onLongPress: widget.onLongPress,
      onHover: widget.onHover,
      onFocusChange: widget.onFocusChange,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    final YgTextLinkTheme theme = context.textLinkTheme;

    final Text text = Text(
      widget.text,
    );

    if (!widget.external) {
      return text;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: text,
        ),
        Padding(
          padding: theme.iconPadding,
          child: YgIcon(
            YgIcons.link,
            color: theme.iconColor,
            size: YgIconSize.small,
          ),
        ),
      ],
    );
  }

  YgTextLinkStyle _createStyle(YgVsync vsync) {
    return YgTextLinkStyle(
      controller: _controller,
      vsync: vsync,
    );
  }
}
