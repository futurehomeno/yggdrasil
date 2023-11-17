part of 'yg_list_tile.dart';

/// Binary (or optionally tri-state) switch.
class YgCheckboxListTile extends _YgListTileWithChildAndOptionalLeading {
  const YgCheckboxListTile({
    super.key,
    required super.title,
    required this.value,
    required this.onChanged,
    super.leadingWidget,
    super.subtitle,
    super.subtitleIcon,
    this.triState = false,
  }) : super(
          disabled: onChanged == null,
        );

  /// See [YgCheckbox] documentation.
  final bool? value;

  /// See [YgCheckbox] documentation.
  final ValueChanged<bool?>? onChanged;

  /// See [YgCheckbox] documentation.
  final bool triState;

  @override
  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(value, triState);
    onChanged?.call(nextValue);
  }

  @override
  Widget _buildChild(BuildContext context) {
    return AbsorbPointer(
      child: YgNoFocus(
        child: YgCheckbox(
          value: value,
          onChanged: onChanged,
          triState: triState,
        ),
      ),
    );
  }
}
