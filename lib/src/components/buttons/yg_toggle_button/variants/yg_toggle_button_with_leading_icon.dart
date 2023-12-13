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

  /// The icon shown before (leading) the [text].
  final YgColorableIconData icon;

  /// The text shown in the button, after (trailing) the [icon].
  final String text;

  @override
  Widget buildChild(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
