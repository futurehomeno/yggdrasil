part of 'yg_tag.dart';

class _YgTagWithDoubleIcon extends YgTag {
  const _YgTagWithDoubleIcon({
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
    required this.leadingIcon,
    required this.trailingIcon,
  });

  /// The icon leading the text of the tag.
  final YgColorableIconData leadingIcon;

  /// The icon trailing the text of the tag.
  final YgColorableIconData trailingIcon;

  @override
  Widget buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        YgIcon(leadingIcon),
        Flexible(child: child),
        YgIcon(trailingIcon),
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
