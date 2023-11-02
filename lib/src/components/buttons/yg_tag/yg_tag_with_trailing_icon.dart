part of 'yg_tag.dart';

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

  final YgIcon icon;

  @override
  Widget buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: child),
        icon,
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
