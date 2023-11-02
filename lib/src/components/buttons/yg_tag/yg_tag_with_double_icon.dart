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

  final YgIcon leadingIcon;
  final YgIcon trailingIcon;

  @override
  Widget buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        leadingIcon,
        Flexible(child: child),
        trailingIcon,
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
