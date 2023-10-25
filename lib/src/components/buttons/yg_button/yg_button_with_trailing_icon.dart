part of 'yg_button.dart';

class _YgButtonWithTrailingIcon extends YgButtonNew {
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

  final YgIcon icon;

  @override
  State<_YgButtonWithTrailingIcon> createState() => _YgButtonWithTrailingIconState();
}

class _YgButtonWithTrailingIconState extends _YgButtonNewState<_YgButtonWithTrailingIcon> {
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
