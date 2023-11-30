part of 'yg_toggle_button.dart';

final class YgToggleIconButton extends YgToggleButton {
  const YgToggleIconButton({
    super.key,
    required super.value,
    required super.onChanged,
    required this.icon,
    super.size,
    super.autofocus,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
  }) : super._();

  /// The icon shown in the button.
  final YgIcon icon;

  @override
  Widget buildChild(BuildContext context) {
    return icon;
  }

  @override
  YgToggleButtonVariant get variant => YgToggleButtonVariant.icon;
}
