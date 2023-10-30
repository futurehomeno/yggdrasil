import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/buttons/widgets/_widgets.dart';
import 'package:yggdrasil/src/components/buttons/yg_text_link/enums/yg_text_link_state.dart';
import 'package:yggdrasil/src/theme/_theme.dart';
import 'package:yggdrasil/yggdrasil.dart';

class YgTextLinkStyle extends YgButtonBaseStyle<YgTextLinkState> {
  YgTextLinkStyle({
    required super.controller,
    required super.vsync,
  });

  @override
  Curve get curve => Curves.easeInOut;

  @override
  Duration get duration => const Duration(milliseconds: 200);

  @override
  Color resolveColor(BuildContext context, Set<YgTextLinkState> states) {
    return Colors.transparent;
  }

  @override
  TextStyle resolveTextStyle(BuildContext context, Set<YgTextLinkState> states) {
    return _getBaseTextStyle(states).copyWith(
      color: _resolveColor(states),
    );
  }

  @override
  OutlinedBorder resolveOutlinedBorder(BuildContext context, Set<YgTextLinkState> states) {
    if (states.focused) {
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

  Color _resolveColor(Set<YgTextLinkState> states) {
    if (states.disabled) {
      return _theme.disabledColor;
    } else if (states.pressed) {
      return _theme.pressedColor;
    } else if (states.hovered) {
      return _theme.hoverColor;
    } else if (states.focused) {
      return _theme.focusColor;
    }

    return _theme.defaultColor;
  }

  TextStyle _getBaseTextStyle(Set<YgTextLinkState> states) {
    switch (states.size) {
      case YgTextLinkSize.small:
        switch (states.weight) {
          case YgTextLinkWeight.weak:
            return _theme.smallWeakTextStyle;
          case YgTextLinkWeight.strong:
            return _theme.smallStrongTextStyle;
        }
      case YgTextLinkSize.medium:
        switch (states.weight) {
          case YgTextLinkWeight.weak:
            return _theme.mediumWeakTextStyle;
          case YgTextLinkWeight.strong:
            return _theme.mediumStrongTextStyle;
        }
    }
  }

  YgTextLinkTheme get _theme => context.textLinkTheme;

  @override
  MouseCursor resolveCursor(BuildContext context, Set<YgTextLinkState> states) {
    if (states.disabled) {
      return SystemMouseCursors.basic;
    }

    return SystemMouseCursors.click;
  }

  @override
  EdgeInsets resolvePadding(BuildContext context, Set<YgTextLinkState> states) {
    return context.textLinkTheme.padding;
  }
}
