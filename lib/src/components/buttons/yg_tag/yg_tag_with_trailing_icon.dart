part of 'yg_tag.dart';

class _YgTagWithTrailingIcon extends YgTag {
  const _YgTagWithTrailingIcon({
    super.key,
    required super.text,
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
  final YgIcon icon;

  @override
  Widget buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(text),
        icon,
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
