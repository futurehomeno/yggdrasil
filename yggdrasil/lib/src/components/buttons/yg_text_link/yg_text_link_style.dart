part of buttons;

class _YgTextLinkStyle extends _YgButtonBaseStyle<_YgTextLinkState> {
  _YgTextLinkStyle({
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

  Color _resolveColor(_YgTextLinkState state) {
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

  TextStyle _getBaseTextStyle(_YgTextLinkState state) {
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
