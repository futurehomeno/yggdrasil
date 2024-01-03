part of '../../yg_list_tile.dart';

final class _YgCheckboxListTileTriState extends YgCheckboxListTile with YgTriStateToggleableMixin {
  const _YgCheckboxListTileTriState({
    super.key,
    required super.title,
    required super.value,
    required this.onChanged,
    super.leadingWidget,
    super.subtitle,
    super.subtitleIcon,
  }) : super._(
          disabled: onChanged == null,
        );

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
