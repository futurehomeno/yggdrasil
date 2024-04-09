part of 'yg_checkbox_item.dart';

final class YgCheckboxItemDualState extends YgCheckboxItem with YgDualStateToggleableMixin {
  const YgCheckboxItemDualState({
    super.key,
    required super.title,
    required super.value,
    required this.onChanged,
  }) : super._();

  /// See [YgCheckbox] documentation.
  @override
  final ValueChanged<bool>? onChanged;

  @override
  YgCheckbox _buildCheckbox() {
    return YgCheckbox(
      value: value,
      onChanged: onChanged,
    );
  }
}
