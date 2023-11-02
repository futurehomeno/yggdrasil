import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_text_link/yg_text_link_style.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_text_link_state.dart';

/// Text link button implementation.
class YgTextLink extends YgButtonBase<YgTextLinkState> {
  const YgTextLink({
    super.key,
    required this.text,
    required super.onPressed,
    this.size = YgTextLinkSize.small,
    this.weight = YgTextLinkWeight.weak,
    this.external = false,
    super.autofocus = false,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
  });

  final String text;
  final YgTextLinkSize size;
  final YgTextLinkWeight weight;
  final bool external;

  @override
  Widget buildChild(BuildContext context) {
    final YgTextLinkTheme theme = context.textLinkTheme;

    final Text text = Text(
      this.text,
    );

    if (!external) {
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

  @override
  YgButtonBaseStyle<YgTextLinkState> createStyle(YgVsync vsync, YgTextLinkState state) {
    return YgTextLinkStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  YgTextLinkState createButtonState() {
    return YgTextLinkState(
      disabled: onPressed == null,
      size: size,
      weight: weight,
    );
  }

  @override
  void updateState(YgTextLinkState state) {
    state.disabled.value = onPressed == null;
    state.size.value = size;
    state.weight.value = weight;
  }
}
