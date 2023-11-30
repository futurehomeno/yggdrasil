part of 'yg_toggle_button.dart';

final class YgToggleButtonWithLeadingIcon extends YgToggleButton {
  const YgToggleButtonWithLeadingIcon({
    super.key,
    required super.value,
    required super.onChanged,
    required this.icon,
    required this.text,
    super.size,
    super.autofocus,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
  }) : super._();

  /// The icon shown in front of the [text].
  final YgIcon icon;

  /// The text shown in the button, behind the [icon].
  final String text;

  @override
  Widget buildChild(BuildContext context) {
    return Row(
      children: <Widget>[
        icon,
        SizedBox(
          width: context.toggleButtonTheme.iconTextSpacing,
        ),
        Text(text),
      ],
    );
  }

  @override
  YgToggleButtonVariant get variant => YgToggleButtonVariant.leadingIcon;
}
