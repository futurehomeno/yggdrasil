part of 'yg_tag.dart';

class _YgTagWithLeadingIcon extends YgTag {
  const _YgTagWithLeadingIcon({
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
  State<_YgTagWithLeadingIcon> createState() => _YgTagWithLeadingIconState();
}

class _YgTagWithLeadingIconState extends _YgTagState<_YgTagWithLeadingIcon> {
  @override
  Widget _buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.icon,
        Flexible(child: widget.child),
      ].withHorizontalSpacing(context.tagTheme.iconSpacing),
    );
  }
}
