part of buttons;


class _YgButtonWithTrailingIcon extends YgButton {
  const _YgButtonWithTrailingIcon({
    super.key,
    required super.child,
    required super.onPressed,
    required this.icon,
    super.size,
    super.variant,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus,
  });

  final YgColorableIconData icon;

  @override
  Widget buildChild(BuildContext context) {
    final YgButtonTheme theme = context.buttonTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: theme.contentPadding,
            child: child,
          ),
        ),
        YgIcon(icon),
      ],
    );
  }
}
