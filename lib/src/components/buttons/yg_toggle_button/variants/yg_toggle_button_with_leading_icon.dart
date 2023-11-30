part of '../yg_toggle_button.dart';

final class _YgToggleButtonWithLeadingIcon extends YgToggleButton {
  const _YgToggleButtonWithLeadingIcon({
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
  final String icon;

  /// The text shown in the button, behind the [icon].
  final String text;

  @override
  Widget buildChild(BuildContext context) {
    return Row(
      children: <Widget>[
        YgIcon(icon),
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
