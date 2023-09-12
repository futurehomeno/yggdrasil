import 'package:flutter/material.dart';
import 'package:yggdrasil/src/components/_components.dart';
import 'package:yggdrasil/src/components/yg_switch/helpers/_yg_switch_helpers.dart';
import 'package:yggdrasil/src/utils/_utils.dart';

/// Binary (or optionally tri-state) switch.
class YgCheckboxListTile extends StatelessWidget {
  const YgCheckboxListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.subtitleIcon,
    this.leadingWidget,
    this.triState = false,
  });

  /// See [YgListTile] documentation.
  final String title;

  /// See [YgListTile] documentation.
  final String? subtitle;

  /// See [YgListTile] documentation.
  final Widget? subtitleIcon;

  /// See [YgCheckbox] documentation.
  final bool? value;

  /// See [YgCheckbox] documentation.
  final ValueChanged<bool?>? onChanged;

  /// See [YgCheckbox] documentation.
  final bool triState;

  /// Optional widget to display before the switch.
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    final Widget? leadingWidget = this.leadingWidget;

    final AbsorbPointer checkbox = AbsorbPointer(
      child: YgNoFocus(
        child: YgCheckbox(
          value: value,
          onChanged: onChanged,
          triState: triState,
        ),
      ),
    );

    return YgListTile(
      title: title,
      subtitle: subtitle,
      subtitleIcon: subtitleIcon,
      onTap: onChanged == null ? null : _onTap,
      leadingWidgets: <Widget>[
        if (leadingWidget == null) checkbox else leadingWidget,
      ],
      trailingWidgets: <Widget>[
        if (leadingWidget != null) checkbox,
      ],
    );
  }

  void _onTap() {
    final bool? nextValue = YgSwitchHelpers.getNextValue(value, triState);
    onChanged?.call(nextValue);
  }
}
