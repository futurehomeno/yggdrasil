part of buttons;


final class _YgToggleTextButton extends YgToggleButton {
  const _YgToggleTextButton({
    super.key,
    required super.value,
    required super.onChanged,
    required this.text,
    super.size,
    super.autofocus,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
  }) : super._();

  /// The text shown in the button.
  final String text;

  @override
  Widget buildChild(BuildContext context) {
    return Text(text);
  }

  @override
  YgToggleButtonVariant get variant => YgToggleButtonVariant.text;
}
