part of 'yg_button.dart';

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

  final YgIcon icon;

  @override
  Widget buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: super.buildChild(context)),
        icon,
      ].withHorizontalSpacing(context.buttonTheme.iconSpacing),
    );
  }
}
