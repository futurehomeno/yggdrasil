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
  State<_YgTagWithDoubleIcon> createState() => _YgTagWithDoubleIconState();
}

class _YgTagWithDoubleIconState extends _YgTagState<_YgTagWithDoubleIcon> {
  @override
  Widget _buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.leadingIcon,
        Flexible(child: widget.child),
        widget.trailingIcon,
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
