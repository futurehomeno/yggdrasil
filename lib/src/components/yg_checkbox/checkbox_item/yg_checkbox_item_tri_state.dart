part of 'yg_checkbox_item.dart';

final class YgCheckboxItemTriState extends YgCheckboxItem with YgTriStateToggleableMixin {
  const YgCheckboxItemTriState({
    super.key,
    required super.title,
    required this.value,
    required this.onChanged,
  }) : super._();

  /// See [YgCheckbox] documentation.
  @override
  final bool? value;

  /// See [YgCheckbox] documentation.
  @override
  final ValueChanged<bool?>? onChanged;

  @override
  YgCheckbox _buildCheckbox() {
    return YgCheckbox.triState(
      value: value,
      onChanged: onChanged,
    );
  }
}
