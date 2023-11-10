part of 'yg_list_tile.dart';

/// Radio button inside a list tile.
class YgRadioListTile<T> extends _YgListTileWithChildAndOptionalLeading {
  const YgRadioListTile({
    super.key,
    required super.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.subtitle,
    super.subtitleIcon,
    super.leadingWidget,
  }) : super(
          disabled: onChanged == null,
        );

  /// See [YgRadio.value].
  final T value;

  /// See [YgRadio.groupValue].
  final T? groupValue;

  /// See [YgRadio.onChanged].
  final ValueChanged<T?>? onChanged;

  @override
  Widget buildChild(BuildContext context) {
    return AbsorbPointer(
      child: YgNoFocus(
        child: YgRadio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ),
    );
  }

  @override
  void _onTap() {
    onChanged?.call(value);
  }
}
