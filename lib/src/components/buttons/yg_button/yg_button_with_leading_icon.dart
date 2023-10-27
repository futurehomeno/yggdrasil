part of 'yg_button.dart';

class _YgButtonWithLeadingIcon extends YgButton {
  const _YgButtonWithLeadingIcon({
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

  final YgIcon icon;

  @override
  State<_YgButtonWithLeadingIcon> createState() => _YgButtonWithLeadingIconState();
}

class _YgButtonWithLeadingIconState extends _YgButtonState<_YgButtonWithLeadingIcon> {
  @override
  Widget _buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.icon,
        Flexible(child: super._buildChild(context)),
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}
