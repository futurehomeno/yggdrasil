part of buttons;

/// Text link button implementation.
class YgTextLink extends _YgButtonBase<_YgTextLinkState> {
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

  /// Text shown in the text link button.
  final String text;

  /// The side of the text link.
  final YgTextLinkSize size;

  /// The weight of the text link.
  final YgTextLinkWeight weight;

  /// Whether the text link links to something outside of the app.
  final bool external;

  @override
  Widget buildChild(BuildContext context) {
    final YgTextLinkTheme theme = context.textLinkTheme;

    final Text text = Text(this.text);

    if (!external) {
      return text;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: text,
        ),
        Padding(
          padding: theme.iconPadding,
          child: YgIcon.colorable(
            YgIcons.link,
            color: theme.iconColor,
            size: YgIconSize.small,
          ),
        ),
      ],
    );
  }

  @override
  _YgButtonBaseStyle<_YgTextLinkState> createStyle(YgVsync vsync, _YgTextLinkState state) {
    return _YgTextLinkStyle(
      state: state,
      vsync: vsync,
    );
  }

  @override
  _YgTextLinkState createButtonState() {
    return _YgTextLinkState(
      disabled: onPressed == null,
      size: size,
      weight: weight,
    );
  }

  @override
  void updateState(_YgTextLinkState state) {
    state.disabled.value = onPressed == null;
    state.size.value = size;
    state.weight.value = weight;
  }
}
