part of buttons;


class _YgTagWithTrailingIcon extends YgTag {
  const _YgTagWithTrailingIcon({
    super.key,
    required super.child,
    super.size = YgTagSize.medium,
    super.variant = YgTagVariant.neutral,
    super.weight = YgTagWeight.weak,
    super.autofocus = false,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.onPressed,
    required this.icon,
  });

  /// The icon trailing the text of the tag.
  final YgColorableIconData icon;

  @override
  Widget buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: child),
        YgIcon(icon),
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
