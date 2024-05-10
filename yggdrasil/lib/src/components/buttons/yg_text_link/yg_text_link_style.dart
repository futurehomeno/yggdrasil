import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

import 'yg_text_link_state.dart';

class YgTextLinkStyle extends YgButtonBaseStyle<YgTextLinkState> {
  YgTextLinkStyle({
    required super.state,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor() {
    return Colors.transparent;
  }

  @override
  TextStyle resolveTextStyle() {
    return _getBaseTextStyle(state).copyWith(
      color: _resolveColor(state),
    );
  }

  @override
  OutlinedBorder resolveOutlinedBorder() {
    if (state.focused.value) {
      return RoundedRectangleBorder(
        side: BorderSide(
          color: _theme.focusColor,
          width: 2,
        ),
        borderRadius: _theme.borderRadius,
      );
    }

    return RoundedRectangleBorder(
      side: BorderSide.none,
      borderRadius: _theme.borderRadius,
    );
  }

  Color _resolveColor(YgTextLinkState state) {
    if (state.disabled.value) {
      return _theme.disabledColor;
    } else if (state.pressed.value) {
      return _theme.pressedColor;
    } else if (state.hovered.value) {
      return _theme.hoverColor;
    } else if (state.focused.value) {
      return _theme.focusColor;
    }

    return _theme.defaultColor;
  }

  TextStyle _getBaseTextStyle(YgTextLinkState state) {
    switch (state.size.value) {
      case YgTextLinkSize.small:
        switch (state.weight.value) {
          case YgTextLinkWeight.weak:
            return _theme.smallWeakTextStyle;
          case YgTextLinkWeight.strong:
            return _theme.smallStrongTextStyle;
        }
      case YgTextLinkSize.medium:
        switch (state.weight.value) {
          case YgTextLinkWeight.weak:
            return _theme.mediumWeakTextStyle;
          case YgTextLinkWeight.strong:
            return _theme.mediumStrongTextStyle;
        }
    }
  }

  YgTextLinkTheme get _theme => context.textLinkTheme;

  @override
  EdgeInsets resolvePadding() {
    return context.textLinkTheme.padding;
  }
}
